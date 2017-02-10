//
//  EMMStoreDetailViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/22.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMStoreDetailViewController.h"
#import "EMMStoreDetailTableViewCell.h"

@interface EMMStoreDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation EMMStoreDetailViewController

static NSString * const EMMStoreDetailViewCell = @"eMMStoreDetailTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"分类详情";
    
    [self setUpMyTableView];
}

#pragma mark -  ============= 私有方法 ===============
/**
 我的 TableView
 */
- (void)setUpMyTableView{
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([EMMStoreDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:EMMStoreDetailViewCell];
    
}

#pragma mark -  ============= UITableView数据源和代理方法 ===============
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMMStoreDetailTableViewCell *eMMStoreDetailCell = [tableView dequeueReusableCellWithIdentifier:EMMStoreDetailViewCell];
    
    return eMMStoreDetailCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142;
}

@end
