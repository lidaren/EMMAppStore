//
//  PlaceholderTextView.h
//  精选速购商城
//
//  Created by YanHui Lee on 2016/11/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView

@property (nonatomic, strong) UILabel * placeHolderLabel;

@property (nonatomic, copy) NSString * placeholder;

@property (nonatomic, strong) UIColor * placeholderColor;

- (void)textChanged:(NSNotification * )notification;

@end
