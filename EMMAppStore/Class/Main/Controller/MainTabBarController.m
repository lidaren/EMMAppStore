//
//  MainTabBarController.m
//  精选速购商城
//
//  Created by YanHui Lee on 2016/10/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MainTabBarController.h"
#import "EMMHomeViewController.h"
#import "EMMStoreViewController.h"
#import "EMMMeViewController.h"
#import "EMMUpdateViewController.h"
#import "MainNavigationController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
}

- (void)addAllChildVcs
{
    // 首页
    [self addOneChildVc:[[MainNavigationController alloc]initWithRootViewController:[[EMMHomeViewController alloc]init]] image:@"tab_icon_home_nor" selectedImageName:@"tab_icon_home_sel" withTitle:@"首页"];
    // 分类
    [self addOneChildVc:[[MainNavigationController alloc]initWithRootViewController:[[EMMStoreViewController alloc]init]] image:@"tab_icon_shop_nor" selectedImageName:@"tab_icon_shop_sel" withTitle:@"市场"];
    // 搜索
    [self addOneChildVc:[[MainNavigationController alloc]initWithRootViewController:[[EMMMeViewController alloc]init]] image:@"tab_icon_profile_nor" selectedImageName:@"tab_icon_profile_sel" withTitle:@"我的"];
    // 购物车
    [self addOneChildVc:[[MainNavigationController alloc]initWithRootViewController:[[EMMUpdateViewController alloc]init]] image:@"tab_icon_update_nor" selectedImageName:@"tab_icon_update_sel" withTitle:@"更新"];
    
    // 设置 tabBar 的文字颜色
    self.tabBar.tintColor = YHColor(62, 167, 248);
    
    
}

- (void) addOneChildVc:(UIViewController *)childVc image:(NSString *)imageName selectedImageName:(NSString *)selectImageName withTitle:(NSString *)title
{
    // 添加文字
    childVc.tabBarItem.title = title;
    
    // 普通tabBar图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中时的tabBar图标
    UIImage *selectImage = [UIImage imageNamed:selectImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectImage;
    
    // 设置tabBar的图片垂直居中
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    
    //    [childVc.tabBarController.tabBar addSubview:backView];
    self.tabBarController.tabBar.opaque = YES;
    [self addChildViewController:childVc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    YHLog(@"tabBar 内存满了");
}


@end
