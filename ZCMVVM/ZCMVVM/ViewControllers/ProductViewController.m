//
//  ProductViewController.m
//  ZCMVVM
//
//  Created by 赵琛 on 2017/3/10.
//  Copyright © 2017年 赵琛. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductView.h"
#import "ProductViewModel.h"
#import "ProductDetailViewController.h"


@interface ProductViewController ()

@property (nonatomic,strong)ProductView *rootView;

@property (nonatomic,strong)ProductViewModel *viewModel;

@end

@implementation ProductViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self.view showWaiting];
    [self.viewModel queryProductList];
}

#pragma mark - setter & getter

- (ProductView *)rootView
{
    if (!_rootView) {
        _rootView = [[ProductView alloc] initWithViewModel:self.viewModel];
        _rootView.backgroundColor = [UIColor whiteColor];
        @weakify(self)
        _rootView.toProductDetailBlock = ^(ProductModel *product){
            @strongify(self)
            ProductDetailViewController *vc = [[ProductDetailViewController alloc] init];
            vc.product = product;
            [self.navigationController pushViewController:vc animated:YES];
        };
    }
    return _rootView;
}

- (ProductViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[ProductViewModel alloc] init];
    }
    return _viewModel;
}

#pragma mark - Private Methods

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"产品";
    
    @weakify(self)
    [self.view addSubview:self.rootView];
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.edges.equalTo(self.view);
    }];
}


@end
