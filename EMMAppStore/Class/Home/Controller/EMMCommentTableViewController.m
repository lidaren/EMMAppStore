//
//  EMMCommentTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMCommentTableViewController.h"

#define headerViewHeight 170

@interface EMMCommentTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation EMMCommentTableViewController

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
    [self.myTableView setContentInset:UIEdgeInsetsMake(headerViewHeight+64, 0, 0, 0)];
    
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
    cell.textLabel.text = @"评论评论评论...";
    
    return cell;
}

@end
