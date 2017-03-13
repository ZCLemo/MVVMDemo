//
//  ProductDetailViewController.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/13.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductModel.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.product.productName;
}


@end
