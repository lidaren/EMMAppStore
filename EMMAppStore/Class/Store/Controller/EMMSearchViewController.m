//
//  EMMSearchViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/13.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMSearchViewController.h"
#import "EMMSearchResultsTableViewCell.h"
#import "EMMDetailsViewController.h"

@interface EMMSearchViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

@end

@implementation EMMSearchViewController
static NSString *const eMMSearchResultsTableViewCell = @"EMMSearchResultsTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"搜索";
    
    self.mySearchBar.delegate = self;
    [self creatMyTableView];
}
#pragma mark - ********** 私有方法 **********
- (void)creatMyTableView{
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    // 注册cell
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([EMMSearchResultsTableViewCell class]) bundle:nil] forCellReuseIdentifier:eMMSearchResultsTableViewCell];
}
#pragma mark - ********** UISearchBar代理方法 **********
// 文字改变的时候
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchBar.text isEqualToString:@""]) {
        self.myTableView.hidden = YES;
    }else{
        self.myTableView.hidden = NO;
        [self.myTableView reloadData];
    }
}
// 点击搜索按钮时候查询
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.mySearchBar resignFirstResponder];
    self.myTableView.hidden = NO;
    [self.myTableView reloadData];
}
#pragma mark - ********** UITableView 数据源方法 **********
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EMMSearchResultsTableViewCell *searchResultsCell = [tableView dequeueReusableCellWithIdentifier:eMMSearchResultsTableViewCell];
    searchResultsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return searchResultsCell;
}
#pragma mark - ********** UITableView 代理方法 **********
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 350.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [EMMUserInfo sharedEMMUserInfo].isThree = YES;
    [self.navigationController pushViewController:[[EMMDetailsViewController alloc] init] animated:YES];
}
@end
