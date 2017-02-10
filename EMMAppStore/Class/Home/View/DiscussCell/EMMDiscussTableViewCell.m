//
//  EMMDiscussTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/10.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDiscussTableViewCell.h"

@implementation EMMDiscussTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createActivityUI];
    }
    return self;
}
- (void)createActivityUI{
    // 用户评论的内容
    UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 80)];
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, ScreenW, 20)];
    userName.text = @"囧囧神猫";
    [userView addSubview:userName];
    
    CGRect frame = CGRectMake(0, 30, 10, 10);
    for (int i = 0; i < 5; i++) {
        frame.origin.x = frame.origin.x + 10;
        UIImageView *imaView = [[UIImageView alloc] initWithFrame:frame];
        imaView.image = [UIImage imageNamed:@"icon_star_small"];
        [userView addSubview:imaView];
    }
    frame.origin.x = frame.origin.x + 20;
    frame.size.width = 120;
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:frame];
    timeLabel.text = @"2017年8月8日";
    [userView addSubview:timeLabel];
    
    UILabel *contextLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, ScreenW - 10, 60)];
    contextLabel.numberOfLines = 0;
    contextLabel.text = @"人生的路上，我们都在奔跑，我们总是在赶超一些人，也总是在被一些人去超越。人生的秘诀，就是寻找一种最适合自己的速度，莫因疾进而不堪重荷，莫要因迟缓而去空耗生命。美好一天从“适度”开始";
    [userView addSubview:contextLabel];
    
    [self addSubview:userView];
    // 商户回复的内容
}
@end
