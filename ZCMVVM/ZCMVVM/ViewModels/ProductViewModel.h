//
//  ProductViewModel.h
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductViewModel : NSObject

- (void)queryProductList;

@property (nonatomic,strong)RACSubject *dataSubject;

@property (nonatomic,strong)RACSubject *errorSubject;

@end
