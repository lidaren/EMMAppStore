//
//  EMMGuestureLockViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/24.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMGuestureLockViewController.h"
#import "DBGuestureLock.h"

#import "MainTabBarController.h"

@interface EMMGuestureLockViewController ()<DBGuestureLockDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleMessage;

@property (weak, nonatomic) IBOutlet UILabel *contentMessage;

@end

@implementation EMMGuestureLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 用于测试
    [DBGuestureLock clearGuestureLockPassword];
    
    DBGuestureLock *lock = [DBGuestureLock lockOnView:self.view delegate:self];
    [self.view addSubview:lock];
    
    self.navigationItem.title = @"设置手势密码";
    
    self.contentMessage.hidden = YES;
}


/**
 跳过手势密码

 @param sender 跳过按钮点击事件
 */
- (IBAction)skipGuesturePassword:(id)sender {
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc]init];
}

#pragma mark - ============= DBGuestureLockDelegate =============

-(void)guestureLock:(DBGuestureLock *)lock didSetPassword:(NSString *)password {
    
    self.contentMessage.hidden = NO;
    
    //NSLog(@"Password set: %@", password);
    if (lock.firstTimeSetupPassword == nil) {
        lock.firstTimeSetupPassword = password;
        NSLog(@"varify your password");
        NSLog(@"当前的密码：%@", [DBGuestureLock getGuestureLockPassword]);
        self.contentMessage.text = @"请再次输入你的手势密码:";
    }
}

-(void)guestureLock:(DBGuestureLock *)lock didGetCorrectPswd:(NSString *)password {
    
    self.contentMessage.hidden = NO;
    
    //NSLog(@"Password correct: %@", password);
    if (lock.firstTimeSetupPassword && ![lock.firstTimeSetupPassword isEqualToString:DBFirstTimeSetupPassword]) {
        lock.firstTimeSetupPassword = DBFirstTimeSetupPassword;
        NSLog(@"已经录入手势密码!");
        self.contentMessage.text = @"已经录入手势密码!";
        [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc]init];
    } else {
        NSLog(@"密码正确");
        self.contentMessage.text = @"密码正确!";
        [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc]init];
    }
}

-(void)guestureLock:(DBGuestureLock *)lock didGetIncorrectPswd:(NSString *)password {
    
    self.contentMessage.hidden = NO;
    
    //NSLog(@"Password incorrect: %@", password);
    NSLog(@"%@ %@", lock.firstTimeSetupPassword, DBFirstTimeSetupPassword);
    if (![lock.firstTimeSetupPassword isEqualToString:DBFirstTimeSetupPassword]) {
        NSLog(@"Error: 两次密码不一致!");
        self.contentMessage.text = @"两次绘制的密码不一致，请重新描绘!";
    } else {
        NSLog(@"密码错误!");
        self.contentMessage.text = @"密码错误!";
    }
}

@end
