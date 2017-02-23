//
//  EMMStoreDetailViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/22.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMStoreDetailViewController.h"
#import "EMMStoreDetailTableViewCell.h"
#import "EMMDetailsViewController.h"
#import "EMMStoreDetailModel.h"

@interface EMMStoreDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@end

@implementation EMMStoreDetailViewController

static NSString * const EMMStoreDetailViewCell = @"eMMStoreDetailTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"分类详情";
    
    [self setUpMyTableView];
    
    // 获取详细的分类信息
    [self loadDataFromNet];
}

- (void)loadDataFromNet{
    [SVProgressHUD show];
    // 按类型搜索应用
    NSDictionary *param = @{
                            @"cid":self.cid,
                            @"platform":@0,
                            @"level":@10002001
                            };
    WEAKSELF
    [EMMHttpTool post:Search_TypeID params:param success:^(id responseObj) {
        [SVProgressHUD dismiss];
        NSData *responseData = responseObj;
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
        /*
         {"code":200,"data":[{"identifier":"com.zyy.bb","total":0,"name":"宝宝爱拍照","icon":"1487302841038.png","length":0,"tip":"宝宝爱拍照是一款记录宝宝成长相册的应用","id":"58abaf58f6731f056a5ea049","pack":"1487646541644.apk"}]}
         */
        
        if ([responseDic[@"code"] isEqual:@200]) {
            // 访问成功
            if ([responseDic[@"data"] isKindOfClass:[NSArray class]]) {
                for (NSDictionary *dic in responseDic[@"data"]) {
                    EMMStoreDetailModel *detailModel = [EMMStoreDetailModel mj_objectWithKeyValues:dic];
                    [weakSelf.dataSourceArr addObject:detailModel];
                }
                [weakSelf.myTableView reloadData];
            }else{
                // 访问不正常
                [SVProgressHUD showErrorWithStatus:responseDic[@"message"]];
                
            }
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络连接超时，请检查网络！"];
    }];
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
    return self.dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMMStoreDetailModel *emmDetailData = self.dataSourceArr[indexPath.row];
    EMMStoreDetailTableViewCell *eMMStoreDetailCell = [tableView dequeueReusableCellWithIdentifier:EMMStoreDetailViewCell];
    [eMMStoreDetailCell setData:emmDetailData];
    eMMStoreDetailCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return eMMStoreDetailCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [EMMUserInfo sharedEMMUserInfo].isThree = YES;
    EMMStoreDetailModel *emmDetailData = self.dataSourceArr[indexPath.row];
    EMMDetailsViewController *detailViewCtl = [[EMMDetailsViewController alloc] init];
    detailViewCtl.ID = emmDetailData.ID;
    [self.navigationController pushViewController:detailViewCtl animated:YES];
}

#pragma mark - ********** 懒加载 **********
- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return _dataSourceArr;
}

@end
