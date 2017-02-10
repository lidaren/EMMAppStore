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

#define headerViewHeight 170

@interface EMMDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) EMMDetailTableViewController *firstVC;
@property (nonatomic, strong) EMMCommentTableViewController *secondVC;
@property (nonatomic, strong) UIViewController *currentVC;

@end

@implementation EMMDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加自控制器
    [self addSubControllers];
    // 创建头部的介绍View
    [self setUpIntroduceView];
}

#pragma mark - ********** 私有方法 **********
- (void)addSubControllers{
    _firstVC = [[EMMDetailTableViewController alloc]init];
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
    iconView.image = [UIImage imageNamed:@"img_wc"];
    [introduceView addSubview:iconView];
    // 主标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 15, ScreenW - 130 - 60, 42)];
    titleLabel.numberOfLines = 2;
    titleLabel.text = @"微信-微信，是一个生活方式，是一个生活方式。";
    [introduceView addSubview:titleLabel];
    // 公司
    UILabel *company = [[UILabel alloc] initWithFrame:CGRectMake(130, 70, ScreenW - 130 - 60, 22)];
    company.text = @"腾讯科技有限公司";
    company.textColor = [UIColor grayColor];
    [introduceView addSubview:company];
    // 文件大小
    UILabel *fileSize = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, ScreenW - 130 - 60, 22)];
    fileSize.textColor = [UIColor grayColor];
    fileSize.text = @"34.2M";
    [introduceView addSubview:fileSize];
    // 筛选
    NSArray *items = @[@"详情", @"评论"];
    UISegmentedControl *chooseItem = [[UISegmentedControl alloc] initWithItems:items];
    chooseItem.frame = CGRectMake(ScreenW/2 -120 , 130, 240, 32);
    chooseItem.tintColor = [UIColor grayColor];
    [chooseItem addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];
    chooseItem.selectedSegmentIndex = 0;
    [introduceView addSubview:chooseItem];
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
