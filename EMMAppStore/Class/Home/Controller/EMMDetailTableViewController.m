//
//  EMMDetailTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDetailTableViewController.h"
#import "EMMCommentTableViewController.h"

#define headerViewHeight 170

@interface EMMDetailTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation EMMDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UITableView
    [self setUpMyTableView];
}
#pragma mark - ********** 私有方法 **********
- (void)setUpMyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    // 设置偏移量
    [self.myTableView setContentInset:UIEdgeInsetsMake(headerViewHeight, 0, 0, 0)];
    
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectZero];
    self.myTableView.tableFooterView = footerView;
}
#pragma mark - ********** UITableView数据源和代理方法 **********
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"测试测试测试...";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EMMCommentTableViewController * ctl = [[EMMCommentTableViewController alloc] init];
    [self.navigationController pushViewController:ctl animated:YES];
}

@end
