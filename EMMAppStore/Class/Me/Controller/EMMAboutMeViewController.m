//
//  EMMAboutMeViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/13.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMAboutMeViewController.h"
#import "SVProgressHUD.h"

@interface EMMAboutMeViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation EMMAboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    
    [self setUpWebView];
    
    [SVProgressHUD show];
}

- (void)setUpWebView{
    self.myWebView.delegate = self;
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.keymobile.com.cn/about"]];
    [self.myWebView loadRequest:requst];
}

#pragma mark --- UIWebViewDelegate
-(void) webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载－－－") ;
}
- (void) webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"加载完成－－－");
    [SVProgressHUD dismiss];
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载失败＝＝＝%@",error);
    [SVProgressHUD dismiss];
}

@end
