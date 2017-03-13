//
//  LoginViewController.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (nonatomic,strong)LoginView *rootView;

@property (nonatomic,strong)LoginViewModel *viewModel;

@end

@implementation LoginViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

#pragma mark - setter & getter

- (LoginView *)rootView
{
    if (!_rootView) {
        _rootView = [[LoginView alloc] initWithViewModel:self.viewModel];;
        _rootView.backgroundColor = [UIColor whiteColor];
    }
    return _rootView;
}

- (LoginViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc] init];
    }
    return _viewModel;
}

#pragma mark - Private Methods

- (void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    
    @weakify(self)
    [self.view addSubview:self.rootView];
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.edges.equalTo(self.view);
    }];
}

@end
