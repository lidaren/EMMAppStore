//
//  EMMHomeCollectionViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/24.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMHomeCollectionViewCell.h"

@implementation EMMHomeCollectionViewCell

//创建自定义cell时调用该方法
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.title];
    }
    return self;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width)];
    }
    return _imageView;
}

- (UILabel *)title{
    if (_title == nil) {
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.width, self.bounds.size.width, 44)];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.font = [UIFont systemFontOfSize:14];
        self.title.numberOfLines = 2;
    }
    return _title;
}

@end
