//
//  EMMHistoryVersionTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/14.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMHistoryVersionTableViewController.h"
#import "EMMHistoryVersionTableViewCell.h"

@interface EMMHistoryVersionTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation EMMHistoryVersionTableViewController
static NSString * const eMMHistoryVersionTableViewCell = @"EMMHistoryVersionTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([EMMHistoryVersionTableViewCell class]) bundle:nil] forCellReuseIdentifier:eMMHistoryVersionTableViewCell];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EMMHistoryVersionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:eMMHistoryVersionTableViewCell];
    
    return cell;
}



@end
