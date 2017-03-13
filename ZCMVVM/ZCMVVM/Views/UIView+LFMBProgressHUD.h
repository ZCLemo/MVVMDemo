//
//  UIView+LFMBProgressHUD.h
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/4/20.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

typedef void (^LFWaitingCompletionBlock)();

@interface UIView (UIView_LFMBProgressHUD)

#pragma mark - 系统菊花

/**
 *  永久性的显示一个等待框，界面用户不可操作。系统菊花黑色
 */
- (void)showWaiting;


/**
 展示文字

 @param toast toast
 */
- (void)showToast:(NSString *)toast;

/**
 *  隐藏一个提醒或等待框 有动画
 */
- (void)hiddenWaiting;

@end
