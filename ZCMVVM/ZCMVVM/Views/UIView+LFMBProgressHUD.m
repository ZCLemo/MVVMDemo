//
//  UIView+LFMBProgressHUD.m
//  LeadbankFoundation
//
//  Created by 安军锋 on 16/4/20.
//  Copyright © 2016年 利得财富. All rights reserved.
//

#import "UIView+LFMBProgressHUD.h"


@implementation UIView (UIView_LFMBProgressHUD)

- (void)showWaiting
{
    MBProgressHUD * hud = [MBProgressHUD HUDForView:self];
    if (!hud)
    {
        hud = [[MBProgressHUD alloc]initWithView:self];
    }
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    [self addSubview:hud];
    [hud showAnimated:YES];
}

- (void)showToast:(NSString *)toast
{
    MBProgressHUD * hud = [MBProgressHUD HUDForView:self];
    if (!hud)
    {
        hud = [[MBProgressHUD alloc]initWithView:self];
    }
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.label.text = toast;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    [self addSubview:hud];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.0];
}


- (void)hiddenWaiting
{
    [MBProgressHUD hideHUDForView:self animated:NO];
}


@end
