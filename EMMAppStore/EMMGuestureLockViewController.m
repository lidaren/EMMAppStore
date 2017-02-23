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
    
    // 获取首页信息
//    NSDictionary *param = @{@"platform": @0,  // xid = d24da813ca009a52 4cbf5cf9ec1e43cd
//                            @"level": @2
//                            };
//    [EMMHttpTool post:GetHome params:param success:^(id responseObj) {
//        NSData *responseData = responseObj;
//        NSString *responseStr =  [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//        /*
//         applications:安装的应用
//         favorites:常用，收藏的应用
//         state:0 停用，1启用
//         
//         {"code":200,"data":{"advertList":[{"id":"58a3b47bf6731f0649f087b3","title":"克拉美钻","image":"1487123545164.jpg","url":"https://www.baidu.com/","state":1,"time":1487123579379,"platform":0}],"applications":[],"favorites":[]}}
//         */
//        YHLog(@"1--%@", responseStr);
//    } failure:^(NSError *error) {
//        YHLog(@"%@", error);
//    }];
    
    // 获取用户的基本信息
//    [EMMHttpTool post:BaseUrl params:nil success:^(id responseObj) {
//        NSData *responseData = responseObj;
//        NSString *responseStr =  [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//        //        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
//        YHLog(@"1.%@", responseStr);
//    } failure:^(NSError *error) {
//        YHLog(@"2.%@", error);
//    }];
    
    
    
    
    
    // 获取我已经安装的应用
//    NSDictionary *param = @{@"platform":@0,
//                            @"level":@10002001
//                            };
//    [EMMHttpTool post:MyInstalled_App params:param success:^(id responseObj) {
//        NSData *responseData = responseObj;
//        NSString *responseStr =  [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//        YHLog(@"%@", responseStr);
//        /*
//         {"code":200,"data":[]}
//         */
//    } failure:^(NSError *error) {
//        YHLog(@"%@", error);
//    }];
    
    // 获取我安装的应用和收藏的应用
//    NSDictionary *param = @{@"platform":@0,
//                            @"level":@10002001
//                            };
//    [EMMHttpTool post:MyAllApp params:param success:^(id responseObj) {
//        NSData *responseData = responseObj;
//        NSString *responseStr =  [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//        YHLog(@"%@", responseStr);
//        /*
//         {"code":200,"data":{"applications":[],"favorites":[]}}
//         */
//    } failure:^(NSError *error) {
//        YHLog(@"%@", error);
//    }];
    
    // 评论列表
//    NSDictionary *param = @{@"aid":@"58abaf58f6731f056a5ea049"};
//    [EMMHttpTool post:Comment_List params:param success:^(id responseObj) {
//        NSData *responseData = responseObj;
//        NSString *responseStr =  [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
//        YHLog(@"%@", responseStr);
//        /*
//         {"code":200,"data":[{"star":3,"id":"58acf27ff6731f05a8e9f18b","time":"2017年02月22日","version":"1.0.3","content":"good","username":"kethina"},{"star":4,"id":"58a6a025f6731f05bb2e0a59","time":"2017年02月17日","version":"1.0.3","content":"good","username":"kethina"},{"star":4,"id":"58a54a0af6731f059f9d564a","time":"2017年02月16日","version":"1.0.3","content":"good software","username":"kethina"},{"star":5,"id":"58a546ddf6731f059f9d5646","time":"2017年02月16日","version":"1.0.3","content":"I like it.","username":"kethina"}]}
//         */
//    } failure:^(NSError *error) {
//        YHLog(@"%@", error);
//    }];
    


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
