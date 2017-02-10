//
//  EMMDiscussViewController.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/10.
//  Copyright © 2017年 GZYY. All rights reserved.
//
//  评论控制器

#import <UIKit/UIKit.h>

@protocol EMMDiscussViewControllerDelegate <NSObject>

- (void)eMMDiscussViewControllerBack;

@end

@interface EMMDiscussViewController : UIViewController
@property (nonatomic,weak) id<EMMDiscussViewControllerDelegate> delegate;
@end
