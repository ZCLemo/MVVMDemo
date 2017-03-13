//
//  UIView+ViewController.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/13.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
