//
//  EMMHomeViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMHomeViewController.h"
#import "EMMHomeOneTableViewCell.h"
#import "EMMHomeTwoTableViewCell.h"
#import "EMMDetailsViewController.h"

@interface EMMHomeViewController ()<UITableViewDataSource, UITableViewDelegate, EMMHomeOneTableViewCellDelegate, EMMHomeTwoTableViewCellDelegate>

/**
 首页的TableView
 */
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation EMMHomeViewController

static NSString * const emmHomeOneCell = @"eMMHomeOneTableViewCell";
static NSString * const emmHomeTwoCell = @"eMMHomeTwoTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"应用商城";
    
    [self setUpMyTableView];
}

#pragma mark - ========== 私有方法 ==========
- (void)setUpMyTableView{
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 150)];
    headerImageView.image = [UIImage imageNamed:@"img_banner"];
    self.myTableView.tableHeaderView = headerImageView;
    
    self.myTableView.backgroundColor = [UIColor whiteColor];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    // 注册 Cell
    [_myTableView registerClass:[EMMHomeOneTableViewCell class] forCellReuseIdentifier:emmHomeOneCell];
    [_myTableView registerClass:[EMMHomeTwoTableViewCell class] forCellReuseIdentifier:emmHomeTwoCell];
}
#pragma mark - ********** EMMHomeOneTableViewCellDelegate **********
- (void)cellSelectBtnClick{
    EMMDetailsViewController *detailViewCtl = [[EMMDetailsViewController alloc] init];
    [self.navigationController pushViewController:detailViewCtl animated:YES];
}
- (void)eMMHomeTwoTableViewCellSelectBtnClick{
    EMMDetailsViewController *detailViewCtl = [[EMMDetailsViewController alloc] init];
    [self.navigationController pushViewController:detailViewCtl animated:YES];
}

#pragma mark - ========== TableView 的数据源和代理方法 ==========
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        EMMHomeOneTableViewCell *homeOneCell = [tableView dequeueReusableCellWithIdentifier:emmHomeOneCell];
        
        if (!homeOneCell) { // 注意：避免 Cell 复用带来问题
            homeOneCell = [[EMMHomeOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:emmHomeOneCell];
        }
        homeOneCell.delegate = self;
        homeOneCell.backgroundColor = [UIColor clearColor];
        homeOneCell.contentView.backgroundColor = [UIColor clearColor];
        homeOneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return homeOneCell;
    }else{
        
        EMMHomeTwoTableViewCell *homeTwoCell = [tableView dequeueReusableCellWithIdentifier:emmHomeTwoCell];
        if (!homeTwoCell) {
            homeTwoCell = [[EMMHomeTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:emmHomeTwoCell];
        }
        homeTwoCell.delegate = self;
        return homeTwoCell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 140;
    }else{
        return 420;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 30)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iConeView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
        iConeView.image = [UIImage imageNamed:@"icon_app"];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 200, 30)];
        titleLabel.text = @"常用应用";
        titleLabel.textColor = [UIColor blackColor];
        
        UIImageView *addImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenW - 30, 7, 18, 18)];
        addImage.image = [UIImage imageNamed:@"icon_add"];
        
        [headerView addSubview:addImage];
        [headerView addSubview:titleLabel];
        [headerView addSubview:iConeView];
        
        return headerView;
    }else{
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 30)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iConeView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
        iConeView.image = [UIImage imageNamed:@"icon_app"];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 200, 30)];
        titleLabel.text = @"已安装应用";
        titleLabel.textColor = [UIColor blackColor];
        
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenW - 60 - 10, 7, 60, 20)];
        rightLabel.text = @"查看全部";
        rightLabel.textColor = [UIColor grayColor];
        rightLabel.font = [UIFont systemFontOfSize:14];
        
        [headerView addSubview:rightLabel];
        [headerView addSubview:titleLabel];
        [headerView addSubview:iConeView];
        
        return headerView;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

@end
