//
//  LoginViewModel.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

//模拟网络请求
- (void)login
{
    if ([self.username isEqualToString:@"123"] && [self.password isEqualToString:@"123"]) {//请求成功
        @weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self)
            [self.successSubject sendNext:@"登录成功"];
        });
    }else{//请求失败
        @weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self)
            [self.errorSubject sendNext:@"账号密码不正确"];
        });
    }
}

#pragma mark - setter & getter

- (RACSubject *)successSubject
{
    if (!_successSubject) {
        _successSubject = [RACSubject subject];
    }
    return _successSubject;
}
- (RACSubject *)errorSubject
{
    if (!_errorSubject) {
        _errorSubject = [RACSubject subject];
    }
    return _errorSubject;
}

@end
