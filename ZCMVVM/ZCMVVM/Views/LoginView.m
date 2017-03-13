//
//  LoginView.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "LoginView.h"
#import "LoginViewModel.h"
#import "AppDelegate.h"

@interface LoginView ()

@property (nonatomic,strong)LoginViewModel *viewModel;

@property (nonatomic,strong)UITextField *usernameTF;

@property (nonatomic,strong)UITextField *passwordTF;

@property (nonatomic,strong)UIButton *loginBtn;

@end

@implementation LoginView

- (id)initWithViewModel:(LoginViewModel *)viewModel
{
    if (self = [super init]) {
        self.viewModel = viewModel;
        [self createUI];
        [self binding];
    }
    return self;
}

- (void)binding
{
    RAC(self.viewModel,username) = self.usernameTF.rac_textSignal;
    RAC(self.viewModel,password) = self.passwordTF.rac_textSignal;
    @weakify(self)
    [self.usernameTF.rac_textSignal subscribeNext:^(id x) {
        @strongify(self)
        [self enableBtn];
    }];
    
    [self.passwordTF.rac_textSignal subscribeNext:^(id x) {
        @strongify(self)
        [self enableBtn];
    }];
    
    [self.viewModel.successSubject subscribeNext:^(id x) {
        [self hiddenWaiting];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate setUpRoot];
    }];
    
    [self.viewModel.errorSubject subscribeNext:^(id x) {
        @strongify(self)
        NSString *error = x;
        [self hiddenWaiting];
        [self showToast:error];
    }];
}

#pragma mark - setter & getter

- (UITextField *)usernameTF
{
    if (!_usernameTF) {
        _usernameTF = [UITextField new];
        _usernameTF.placeholder = @"请输入用户名";
        _usernameTF.borderStyle = UITextBorderStyleLine;
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usernameTF.text = @"123";
    }
    return _usernameTF;
}

- (UITextField *)passwordTF
{
    if (!_passwordTF) {
        _passwordTF = [UITextField new];
        _passwordTF.placeholder = @"请输入密码";
        _passwordTF.borderStyle = UITextBorderStyleLine;
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.text = @"123";
        
    }
    return _passwordTF;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = [UIColor redColor];
        [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        @weakify(self)
        [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            [self showWaiting];
            [self.viewModel login];
        }];
    }
    return _loginBtn;
}

#pragma mark - Private Methods

- (void)createUI
{
    @weakify(self)
    [self addSubview:self.usernameTF];
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self).with.offset(20);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
        make.height.equalTo(@44);
    }];
    
    [self addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.usernameTF.mas_bottom).with.offset(30);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
        make.height.equalTo(@44);

    }];
    
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.passwordTF.mas_bottom).with.offset(30);
        make.left.equalTo(self).with.offset(20);
        make.right.equalTo(self).with.offset(-20);
        make.height.equalTo(@44);
    }];
}

- (void)enableBtn
{
    self.loginBtn.enabled = self.usernameTF.text.length > 0 && self.passwordTF.text.length > 0;
}


@end
