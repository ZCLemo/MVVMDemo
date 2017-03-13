//
//  ProductCell.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/13.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductCell.h"
#import "ProductModel.h"

@interface ProductCell ()

@property (nonatomic,strong)UIImageView *productImageV;

@property (nonatomic,strong)UILabel *nameLb;

@property (nonatomic,strong)UILabel *descLb;

@end

@implementation ProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

#pragma mark - setter & getter

- (UIImageView *)productImageV
{
    if (!_productImageV) {
        _productImageV = [UIImageView new];
        _productImageV.image = [UIImage imageNamed:@"product.jpg"];
    }
    return _productImageV;
}


- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        _nameLb.font = [UIFont systemFontOfSize:18];
    }
    return _nameLb;
}

- (UILabel *)descLb
{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.numberOfLines = 0;
    }
    return _descLb;
}

- (void)setProdct:(ProductModel *)prodct
{
    _prodct = prodct;
    self.nameLb.text = _prodct.productName;
    self.descLb.text = _prodct.productDesc;
}

#pragma mark - Private Methods

- (void)createUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    @weakify(self)
    [self.contentView addSubview:self.productImageV];
    [self.productImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.left.equalTo(self.contentView).with.offset(20);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.contentView addSubview:self.nameLb];
    [self.nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.productImageV.mas_top);
        make.left.equalTo(self.productImageV.mas_right).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-20);
        make.height.equalTo(@18);
    }];
    
    [self.contentView addSubview:self.descLb];
    [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.nameLb.mas_bottom).with.offset(5);
        make.left.equalTo(self.productImageV.mas_right).with.offset(15);
        make.right.equalTo(self.contentView.mas_right).with.offset(-20);
        make.height.equalTo(@40);
    }];
}

@end
