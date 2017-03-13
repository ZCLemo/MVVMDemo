//
//  LoginViewModel.h
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/9.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic,strong)NSString *username;

@property (nonatomic,strong)NSString *password;

//登录
- (void)login;

@property (nonatomic,strong)RACSubject *successSubject;

@property (nonatomic,strong)RACSubject *errorSubject;

@end
