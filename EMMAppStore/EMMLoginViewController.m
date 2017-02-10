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
    
    [self.navigationController pushViewController:[[EMMGuestureLockViewController alloc] init] animated:YES];
}

@end
