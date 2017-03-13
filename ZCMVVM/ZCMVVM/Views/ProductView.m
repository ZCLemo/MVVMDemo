//
//  ProductView.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductView.h"
#import "ProductViewModel.h"
#import "ProductCell.h"
#import "ProductModel.h"

@interface ProductView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)ProductViewModel *viewModel;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *productList;

@end

@implementation ProductView

- (id)initWithViewModel:(ProductViewModel *)viewModel
{
    if (self = [super init]) {
        self.viewModel = viewModel;
        [self createUI];
        [self binding];
    }
    return self;
}

- (void)binding
{
    @weakify(self)
    [self.viewModel.dataSubject subscribeNext:^(id x) {
        @strongify(self)
        [self.viewController.view hiddenWaiting];
        self.productList = x;
        [self.tableView reloadData];
    }];
    
    //请求失败
    [self.viewModel.errorSubject subscribeNext:^(id x) {
        @strongify(self)
        [self.viewController.view hiddenWaiting];
        [self.viewController.view showToast:@"失败啦"];
    }];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ProductCell class] forCellReuseIdentifier:KProductCellId];
        
    }
    return _tableView;
}

#pragma mark - Private Methods

- (void)createUI
{
    @weakify(self)
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.edges.equalTo(self);
    }];
}



#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.productList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:KProductCellId forIndexPath:indexPath];
    ProductModel *product = self.productList[indexPath.row];
    cell.prodct = product;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductModel *product = self.productList[indexPath.row];
    if (self.toProductDetailBlock) {
        self.toProductDetailBlock(product);
    }
}

@end
