//
//  EMMDiscussViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/10.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDiscussViewController.h"
#import "ZJD_StarEvaluateView.h"
#import "PlaceholderTextView.h"

@interface EMMDiscussViewController ()<UITextViewDelegate>{
    NSInteger _starIndex; // 记录点击的星数
}
@property (weak, nonatomic) IBOutlet UIView *starView; // 显示星星的View
@property (weak, nonatomic) IBOutlet UIView *inputView; // 输入的View
@property (nonatomic, strong) PlaceholderTextView *placeholderTextView;
@end

@implementation EMMDiscussViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    // star
    [self setStar];
    // input
    [self setUpInputTextView];
}

- (void)setUpInputTextView{
    
    PlaceholderTextView *placehoderTextView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0, 10, ScreenW - 20, 220)];
    placehoderTextView.backgroundColor = [UIColor whiteColor];
    placehoderTextView.delegate = self;
    placehoderTextView.font = [UIFont systemFontOfSize:16.f];
    placehoderTextView.textColor = [UIColor blackColor];
    placehoderTextView.textAlignment = NSTextAlignmentLeft;
    placehoderTextView.editable = YES;
    placehoderTextView.placeholderColor = YHColor(0x89, 0x89, 0x89);
    placehoderTextView.placeholder = @"评论内容";
    self.placeholderTextView = placehoderTextView;
    [self.inputView addSubview:self.placeholderTextView];
    
}

- (void)setStar{
    CGFloat starWidth = 30.f;
    CGFloat space = 20.f;
    ZJD_StarEvaluateView *starView = [[ZJD_StarEvaluateView alloc] initWithFrame:CGRectMake(0, 0, 240, 44) starIndex:5 starWidth:starWidth space:space defaultImage:nil lightImage:nil isCanTap:YES];
    starView.starEvaluateBlock = ^(ZJD_StarEvaluateView * starView, NSInteger starIndex){
        _starIndex = starIndex;
        YHLog(@"--%ld", (long)_starIndex);
    };
    [self.starView addSubview:starView];
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)leftButtonOnClick{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(eMMDiscussViewControllerBack)]) {
            [self.delegate eMMDiscussViewControllerBack];
        }
    }];
    
}

#pragma mark - ********** 按钮点击事件 **********
- (IBAction)cannelButtonOnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(eMMDiscussViewControllerBack)]) {
            [self.delegate eMMDiscussViewControllerBack];
        }
    }];
}
- (IBAction)finishButtonOnClick:(id)sender {
}

@end
