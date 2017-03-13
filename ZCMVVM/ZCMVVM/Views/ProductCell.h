//
//  ProductCell.h
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/13.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProductModel;

#define KProductCellId @"ProductCell"

@interface ProductCell : UITableViewCell

@property (nonatomic,strong)ProductModel *prodct;

@end
