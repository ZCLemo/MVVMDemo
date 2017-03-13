//
//  ProductView.h
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductViewModel;
@class ProductModel;

typedef void(^ ToProductDetailBlock)(ProductModel *product);

@interface ProductView : UIView

- (id)initWithViewModel:(ProductViewModel *)viewModel;

@property (nonatomic,copy) ToProductDetailBlock toProductDetailBlock;

@end
