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
    
    [self loadDataFormNet]; //加载数据
}

#pragma mark -  ============= 私有方法 ===============
/**
 加载网络数据
 */
- (void)loadDataFormNet{
    [SVProgressHUD show];
    WEAKSELF
    // 获取分类的名称
    [EMMHttpTool post:Category_List params:nil success:^(id responseObj) {
        [SVProgressHUD dismiss];
        NSData *responseData = responseObj;
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
        /*
         {"code":200,"data":[{"id":"589d29a6f6731f06fdaffe6c","name":"基础服务"},{"id":"589d29adf6731f06fdaffe6d","name":"商务应用"},{"id":"589d29b3f6731f06fdaffe6e","name":"交流娱乐"},{"id":"589d29baf6731f06fdaffe6f","name":"互联网媒体"},{"id":"589d29bff6731f06fdaffe70","name":"办公软件"},{"id":"58a674f3f6731f06b8243559","name":"游戏"}]}
         */
        if ([responseDic[@"code"] isEqual:@200]) {
            // 访问成功
            for (NSDictionary *dic in responseDic[@"data"]) {
                CategoryListData *cateListData = [CategoryListData new];
                cateListData.ID = dic[@"id"];
                cateListData.name = dic[@"name"];
                [weakSelf.dataArray addObject:cateListData];
            }
            [weakSelf.myTableView reloadData];
        }else{
            // 访问不正常
            [SVProgressHUD showErrorWithStatus:responseDic[@"message"]];
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络连接超时，请检查网络！"];
    }];
}

/**
 我的TableView
 */
- (void)setUpMyTableView{
    
//    EMMStoreViewModel *storeModel1 = [EMMStoreViewModel new];
//    storeModel1.icon = @"icon_games";
//    storeModel1.title = @"游戏";
//    EMMStoreViewModel *storeModel2 = [EMMStoreViewModel new];
//    storeModel2.icon = @"icon_kid";
//    storeModel2.title = @"儿童";
//    EMMStoreViewModel *storeModel3 = [EMMStoreViewModel new];
//    storeModel3.icon = @"icon_camera";
//    storeModel3.title = @"摄影";
//    EMMStoreViewModel *storeModel4 = [EMMStoreViewModel new];
//    storeModel4.icon = @"icon_buy";
//    storeModel4.title = @"购物";
//    EMMStoreViewModel *storeModel5 = [EMMStoreViewModel new];
//    storeModel5.icon = @"icon_setting";
//    storeModel5.title = @"系统";
//    
//    _dataArray = [[NSMutableArray alloc] initWithObjects:storeModel1, storeModel2, storeModel3, storeModel4, storeModel5, nil];
    
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
    
    CategoryListData *storeModel = _dataArray[indexPath.row];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.alimeigou.com%@", storeModel.]]];
    cell.textLabel.text = storeModel.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了...");
    CategoryListData *storeModel = _dataArray[indexPath.row];
    EMMStoreDetailViewController *detailCtl = [[EMMStoreDetailViewController alloc] init];
    detailCtl.cid = storeModel.ID;
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

#pragma mark - ********** 懒加载 **********
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end

@implementation CategoryListData
@end
