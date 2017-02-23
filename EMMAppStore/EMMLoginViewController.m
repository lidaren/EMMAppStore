//
//  EMMLoginViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/22.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMLoginViewController.h"

#import "EMMGuestureLockViewController.h"

@interface EMMLoginViewController ()


/**
 账号
 */
@property (weak, nonatomic) IBOutlet UITextField *userName;

/**
 密码
 */
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation EMMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

//
/**
 点击登录按钮触发事件

 */
- (IBAction)loginBtnOnClick:(UIButton *)sender {
    
    [SVProgressHUD show];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *param = @{@"username": @"qwer",  // xid = d24da813ca009a52 4cbf5cf9ec1e43cd
                            @"password": @"123"
                            };
    
    [manager POST:User_Auto parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        [SVProgressHUD dismiss];
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSDictionary *allHeaders = response.allHeaderFields;
        [EMMUserInfo sharedEMMUserInfo].xid = allHeaders[@"xid"]; //保存xid
        
        if ([responseObject[@"code"] isEqual:@200]) {
            // 验证成功
            [self.navigationController pushViewController:[[EMMGuestureLockViewController alloc] init] animated:YES];
        }else{
            [SVProgressHUD showErrorWithStatus:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接超时..."];
    }];
    
    
//    [manager POST:BaseUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
//        
//        [SVProgressHUD dismiss];
//        
//        YHLog(@"1.%@", responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        YHLog(@"2.%@", error);
//        [SVProgressHUD showErrorWithStatus:@"网络连接超时..."];
//    }];
    
}

@end
