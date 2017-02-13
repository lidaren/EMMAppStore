//
//  EMMCommentTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMCommentTableViewController.h"
#import "EMMDiscussViewController.h"
#import "EMMDiscussTableViewCell.h"

#define headerViewHeight 170

@interface EMMCommentTableViewController ()<UITableViewDataSource, UITableViewDelegate, EMMDiscussViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation EMMCommentTableViewController

static NSString *const eMMDiscussTableViewCell = @"EMMDiscussTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UITableView
    [self setUpMyTableView];
}

#pragma mark - ********** 私有方法 **********
- (void)setUpMyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [self.myTableView registerClass:[EMMDiscussTableViewCell class] forCellReuseIdentifier:eMMDiscussTableViewCell];
    // 设置偏移量
    [self.myTableView setContentInset:UIEdgeInsetsMake(headerViewHeight+64, 0, 0, 0)];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    UILabel *commentCountLb = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, ScreenW*0.5, 20)];
    commentCountLb.text = @"1024条来自用户的评论";
    [headerView addSubview:commentCountLb];
    UIButton *goToDiscussBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    goToDiscussBtn.frame = CGRectMake(ScreenW - 80 - 10, 15, 80, 20);
    [goToDiscussBtn setTitle:@"我要评论" forState:UIControlStateNormal];
    [goToDiscussBtn setTitleColor:YHColor(62, 167, 248) forState:UIControlStateNormal];
    [goToDiscussBtn addTarget:self action:@selector(gotoDiscussBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:goToDiscussBtn];
    self.myTableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectZero];
    self.myTableView.tableFooterView = footerView;
}

- (void)gotoDiscussBtnOnClick{
    self.myTableView.hidden = YES;
    EMMDiscussViewController *discussCtl = [[EMMDiscussViewController alloc] init];
    discussCtl.delegate = self;
//    [self.navigationController pushViewController:discussCtl animated:YES];
    [self presentViewController:discussCtl animated:YES completion:^{
        
    }];
}

- (void)eMMDiscussViewControllerBack{
    [self.myTableView setContentInset:UIEdgeInsetsMake(headerViewHeight+64, 0, 0, 0)];
    self.myTableView.hidden = NO;
}

#pragma mark - ********** UITableView数据源和代理方法 **********
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    static NSString *identifier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
//    }
//    cell.textLabel.text = @"评论评论评论...";
//    return cell;
    
    EMMDiscussTableViewCell *discussCell = [tableView dequeueReusableCellWithIdentifier:eMMDiscussTableViewCell];
    
    return discussCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

@end
