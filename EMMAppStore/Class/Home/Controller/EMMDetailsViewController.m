//
//  EMMDetailsViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//
//  应用详情页

#import "EMMDetailsViewController.h"
#import "EMMDetailTableViewController.h"
#import "EMMCommentTableViewController.h"
#import "EMMDownLoadButton.h"
#import "EMMApplicationModel.h"

#define headerViewHeight 170

@interface EMMDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) EMMDetailTableViewController *firstVC;
@property (nonatomic, strong) EMMCommentTableViewController *secondVC;
@property (nonatomic, strong) UIViewController *currentVC;

/**
 应用的详细信息
 */
@property (nonatomic, strong) EMMApplicationModel *appDetailModel;

@end

@implementation EMMDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载数据
    [self loadDataFromNet];
}

#pragma mark - ********** 私有方法 **********
// 从网络上加载应用的相信信息
- (void)loadDataFromNet{
    [SVProgressHUD show];
    if (!self.ID) {
        self.ID = @"58abaf58f6731f056a5ea049";
    }
    WEAKSELF
    // 获取应用的详细信息
    NSDictionary *param = @{@"id":self.ID};
    [EMMHttpTool post:Get_App_Information params:param success:^(id responseObj) {
        [SVProgressHUD dismiss];
        NSData *responseData = responseObj;
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
//        YHLog(@"%@", responseDic);
        /*
         {"code":200,"data":{"summary":"【一家人分享宝宝成长的喜悦】\u003cbr/\u003e家庭成员共同记录宝宝成长点滴\u003cbr/\u003e照片+文字，满足记录宝宝成长故事的需求\u003cbr/\u003e\u003cbr/\u003e【智能整理照片，便捷的发布流程】\u003cbr/\u003e根据时间自动归类整理，讲述生活故事\u003cbr/\u003e裁剪、美化、备注一步到位\u003cbr/\u003e\u003cbr/\u003e【即时同步】\u003cbr/\u003e新发布内容，亲友都可以收到通知\u003cbr/\u003e即使不在宝宝身边，也能陪伴宝宝成长\u003cbr/\u003e\u003cbr/\u003e【私密空间】\u003cbr/\u003e只有通过授权添加，才能成为宝宝亲人\u003cbr/\u003e亲人才能进入宝宝的私密空间，分享照片\u003cbr/\u003e\u003cbr/\u003e【亲友邀请】\u003cbr/\u003e轻松邀请亲友加入宝宝爱拍照\u003cbr/\u003e一起分享宝宝成长历程\u003cbr/\u003e","identifier":"com.zyy.bb","icon":"1487302841038.png","length":0,"readme":"1.0.3\u003cbr/\u003e应用主要的特色：\u003cbr/\u003e1）以家庭亲友为单位，支持多人共同记录宝宝的成长历程；\u003cbr/\u003e2）可从手机通讯录添加宝宝亲友、设置权限；\u003cbr/\u003e3）支持发布手机照片/拍照发布，智能整理照片；\u003cbr/\u003e4）可针对每张图片单独裁剪、美化、添加备注；\u003cbr/\u003e5）便捷的评论、点赞互动功能。","version":"1.0.3","pack":"1487646541644.apk","screenshots":["1487302846123.jpg","1487302852831.jpg","1487302855138.jpg","1487302848586.jpg","1487302844108.jpg"],"platform":0,"name":"宝宝爱拍照","developer":"广州飞鱼科技","id":"58abaf58f6731f056a5ea049","time":"2017年02月21日","category":"基础服务","compatibility":"Android4.0.4","did":"589d293ff6731f06fdaffe66"}}
         */
        
        if ([responseDic[@"code"] isEqual:@200]) {
            // 访问正常
            _appDetailModel = [EMMApplicationModel mj_objectWithKeyValues:responseDic[@"data"]];
            // 创建头部的介绍View
            [weakSelf setUpIntroduceView];
            // 添加自控制器
            [weakSelf addSubControllers];
        }else{
            // 访问不正常
            [SVProgressHUD showErrorWithStatus:responseDic[@"message"]];
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        YHLog(@"%@", error);
        [SVProgressHUD showErrorWithStatus:@"网络连接超时，请检查网络！"];
    }];
}

- (void)addSubControllers{
    _firstVC = [[EMMDetailTableViewController alloc]init];
    _firstVC.applicationModel = self.appDetailModel;
    [self addChildViewController:_firstVC];
    _secondVC = [[EMMCommentTableViewController alloc]init];
    [self addChildViewController:_secondVC];
    //调整子视图控制器的Frame已适应容器View
    [self fitFrameForChildViewController:_firstVC];
    //设置默认显示在容器View的内容
    [self.contentView addSubview:_firstVC.view];
    _currentVC = _firstVC;
}
//转换子视图控制器
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            _currentVC = newViewController;
        }else{
            _currentVC = oldViewController;
        }
    }];
}
// 调整控制器
- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = self.contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

/**
 头部的View - 介绍应用
 */
- (void)setUpIntroduceView{
    CGRect frame = CGRectMake(0, 64, ScreenW, headerViewHeight);
    UIView *introduceView = [[UIView alloc] initWithFrame:frame];
    introduceView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    // 图标
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 104, 104)];
//    iconView.image = [UIImage imageNamed:@"img_wc"];
    [iconView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ImagesUrl, self.appDetailModel.icon]]];
    [introduceView addSubview:iconView];
    // 主标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 15, ScreenW - 130 - 60, 42)];
    titleLabel.numberOfLines = 2;
//    titleLabel.text = @"微信-微信，是一个生活方式，是一个生活方式。";
    titleLabel.text = self.appDetailModel.name;
    [introduceView addSubview:titleLabel];
    // 公司
    UILabel *company = [[UILabel alloc] initWithFrame:CGRectMake(130, 70, ScreenW - 130 - 60, 22)];
//    company.text = @"腾讯科技有限公司";
    company.text = self.appDetailModel.developer;
    company.textColor = [UIColor grayColor];
    [introduceView addSubview:company];
    // 文件大小
    UILabel *fileSize = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, ScreenW - 130 - 60, 22)];
    fileSize.textColor = [UIColor grayColor];
//    fileSize.text = @"34.2M";
    fileSize.text = [NSString stringWithFormat:@"%ldM", self.appDetailModel.length];
    [introduceView addSubview:fileSize];
    // 筛选
    NSArray *items = @[@"详情", @"评论"];
    UISegmentedControl *chooseItem = [[UISegmentedControl alloc] initWithItems:items];
    chooseItem.frame = CGRectMake(ScreenW/2 -120 , 130, 240, 32);
    chooseItem.tintColor = [UIColor grayColor];
    [chooseItem addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];
    chooseItem.selectedSegmentIndex = 0;
    [introduceView addSubview:chooseItem];
    // 下载按钮
    UIView *downloadView = [[UIView alloc] initWithFrame:CGRectMake(ScreenW - 60, 80, 46, 30)];
    downloadView.backgroundColor = [UIColor redColor];
    EMMDownLoadButton *downloadButton = [EMMDownLoadButton show];
    [downloadView addSubview:downloadButton];
    [introduceView addSubview:downloadView];
    // 分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headerViewHeight - 1, ScreenW, 0.2)];
    lineView.backgroundColor = [UIColor grayColor];
    [introduceView addSubview:lineView];
    
    [self.view addSubview:introduceView];
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            if (_currentVC == _firstVC) return;
            [self fitFrameForChildViewController:_firstVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_firstVC];
            break;
        case 1:
            if (_currentVC == _secondVC) return;
            [self fitFrameForChildViewController:_secondVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_secondVC];
            break;
        default:
            break;
    }
}


@end
