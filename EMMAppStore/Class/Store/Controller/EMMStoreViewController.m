//
//  EMMStoreViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMStoreViewController.h"
#import "EMMStoreDetailViewController.h"
#import "EMMSearchViewController.h"

@interface EMMStoreViewModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

@end
@implementation EMMStoreViewModel

@end

@interface EMMStoreViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation EMMStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"市场";
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self setUpMyTableView];
}

#pragma mark -  ============= 私有方法 ===============
/**
 我的TableView
 */
- (void)setUpMyTableView{
    
    EMMStoreViewModel *storeModel1 = [EMMStoreViewModel new];
    storeModel1.icon = @"icon_games";
    storeModel1.title = @"游戏";
    EMMStoreViewModel *storeModel2 = [EMMStoreViewModel new];
    storeModel2.icon = @"icon_kid";
    storeModel2.title = @"儿童";
    EMMStoreViewModel *storeModel3 = [EMMStoreViewModel new];
    storeModel3.icon = @"icon_camera";
    storeModel3.title = @"摄影";
    EMMStoreViewModel *storeModel4 = [EMMStoreViewModel new];
    storeModel4.icon = @"icon_buy";
    storeModel4.title = @"购物";
    EMMStoreViewModel *storeModel5 = [EMMStoreViewModel new];
    storeModel5.icon = @"icon_setting";
    storeModel5.title = @"系统";
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:storeModel1, storeModel2, storeModel3, storeModel4, storeModel5, nil];
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
}

/**
 点击市场中的搜索按钮
 */
- (void)rightBarButtonItemAction{
    YHLog(@"在市场中点击了搜索...");
    
    EMMSearchViewController *searchCtl = [[EMMSearchViewController alloc] init];
    [self.navigationController pushViewController:searchCtl animated:YES];
}

#pragma mark -  ============= UITableView数据源和代理方法 ===============
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"EMMStoreViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    EMMStoreViewModel *storeModel = _dataArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:storeModel.icon];
    cell.textLabel.text = storeModel.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了...");
    EMMStoreDetailViewController *detailCtl = [[EMMStoreDetailViewController alloc] init];
    [self.navigationController pushViewController:detailCtl animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 30)];
    
//    UIImageView *iConeView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 20, 20)];
//    iConeView.image = [UIImage imageNamed:@"icon_app"];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 200, 30)];
    titleLabel.text = @"所有类别";
    titleLabel.textColor = [UIColor grayColor];
    
    [headerView addSubview:titleLabel];
//    [headerView addSubview:iConeView];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
