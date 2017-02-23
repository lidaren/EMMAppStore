//
//  EMMUpdateViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMUpdateViewController.h"
#import "EMMUpdateTableViewCell.h"
#import "EMMDetailsViewController.h"

@interface EMMUpdateViewController ()<UITableViewDataSource, UITableViewDelegate, EMMUpdateTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *cellHeigh;

@end

static NSString * const eMMUpdateTableViewCell = @"eMMUpdateTableViewCell";

@implementation EMMUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"更新";
    
    [self setUpMytableView];
    
    
    NSArray *arr = @[@84, @84, @84, @84];
    
    self.cellHeigh = [NSMutableArray arrayWithArray:arr];
    
}

- (NSArray *)dataSourceArr{
    if (!_cellHeigh) {
        _cellHeigh = [[NSMutableArray alloc] init];;
    }
    return _cellHeigh;
}

#pragma mark -  ============= 私有方法 ===============
- (void)setUpMytableView{
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([EMMUpdateTableViewCell class]) bundle:nil] forCellReuseIdentifier:eMMUpdateTableViewCell];
    
}

#pragma mark -  ============= UITableView数据源和代理方法 ===============
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMMUpdateTableViewCell *upDataCell = [tableView dequeueReusableCellWithIdentifier:eMMUpdateTableViewCell];
    upDataCell.selectionStyle = UITableViewCellSelectionStyleNone;
    upDataCell.delegate = self;
    return upDataCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [self.cellHeigh[indexPath.row] floatValue];
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 30)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 200, 30)];
    titleLabel.text = @"可用的更新";
    titleLabel.textColor = [UIColor grayColor];
    [headerView addSubview:titleLabel];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [EMMUserInfo sharedEMMUserInfo].isThree = NO;
    [self.navigationController pushViewController:[[EMMDetailsViewController alloc] init] animated:YES];
}

#pragma mark - ********** cell的代理方法 **********
- (void)reloadData:(UITableViewCell *)cell withHeight:(CGFloat)height{
    NSIndexPath *indexPath = [_myTableView indexPathForCell:cell];
    
    self.cellHeigh[indexPath.row] = [NSString stringWithFormat:@"%f",height];
    
    [self.myTableView reloadData];
}

@end
