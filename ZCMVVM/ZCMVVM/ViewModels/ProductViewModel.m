//
//  ProductViewModel.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductViewModel.h"
#import "ProductModel.h"

@implementation ProductViewModel

//模拟网络请求
- (void)queryProductList
{
    NSMutableArray *productList = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        ProductModel *product = [[ProductModel alloc] init];
        product.productName = @"香辣虾";
        product.productDesc = @"好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾好吃的香辣虾";
        [productList addObject:product];
    }
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        [self.dataSubject sendNext:productList];
    });
}

#pragma mark - setter & getter

- (RACSubject *)dataSubject
{
    if (!_dataSubject) {
        _dataSubject = [RACSubject subject];
    }
    return _dataSubject;
}

- (RACSubject *)errorSubject
{
    if (!_errorSubject) {
        _errorSubject = [RACSubject subject];
    }
    return _errorSubject;
}


@end
