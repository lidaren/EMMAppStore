//
//  AppDelegate.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "AppDelegate.h"
#import "EMMLoginViewController.h"
#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    self.window.backgroundColor = [UIColor whiteColor];
    // 2.显示窗口
    [self.window makeKeyAndVisible];
    
    UINavigationController *loginNavCtl = [[MainNavigationController alloc] initWithRootViewController:[[EMMLoginViewController alloc]init]];
    self.window.rootViewController = loginNavCtl;
    
    // 键盘管理,点击文本框输入时若遮挡住了文本框，则使文本框自动上移
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;
    keyboardManager.keyboardDistanceFromTextField = 10;
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    // keyboardManager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
