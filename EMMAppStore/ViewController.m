//
//  ViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "ViewController.h"
#import "MainTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 44, 44)];
    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn  addTarget:self action:@selector(loginBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)loginBtnOnClick{
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end
