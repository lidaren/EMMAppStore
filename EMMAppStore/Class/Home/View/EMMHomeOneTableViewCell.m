//
//  EMMHomeOneTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/23.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMHomeOneTableViewCell.h"

@interface EMMHomeOneTableViewCell()

@property (nonatomic, weak) UIScrollView *backGroundView;

@end

@implementation EMMHomeOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createActivityUI];
    }
    return self;
}

/**
 初始化Cell
 */
- (void)layoutSubviews
{
    
}

- (void)createActivityUI{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 140 - 0.5)];
    //    scrollView.pagingEnabled = YES;
    //    scrollView.contentSize =  CGSizeMake(ScreenW*2, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, ScreenW, 0.3)];
    lineView.backgroundColor = [UIColor grayColor];
    
    self.backGroundView = scrollView;
    
    [self addSubview:lineView];
    [self addSubview:scrollView];
    
    // 添加Button
    [self addButton];
}

- (void)addButton{
    
    NSArray *images = @[@"img_wc", @"img_qq", @"img_weibo", @"img_wymusic", @"img_gdmap", @"img_souhu", @"img_tmall"];
    NSArray *titleArr = @[@"微信", @"QQ", @"微博", @"网易云音乐", @"高德地图", @"搜狐", @"天猫"];
    
    int count = 7;
    
    CGFloat edge = 20;      // 边距
    CGFloat width = 80;    // 宽
    CGFloat height = 80;   // 高
    
    for (int i = 0; i < count; i++) {
        
        
        
        CGFloat y = 10;
        
        
        CGFloat x = i * width + edge * (i+1);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
//        btn.backgroundColor = YHRandomColor;
        [btn setBackgroundImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
//        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        //     CGFloat top, CGFloat left, CGFloat bottom, CGFloat right
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,20,  -40, -20)];
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(90, 10, 0, 0)];
        
        [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, height + 5, 80, 30)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = titleArr[i];
        
        [self.backGroundView addSubview:titleLabel];
        [self.backGroundView addSubview:btn];
    }
    
    // 计算 scrollView 的宽
    CGFloat scrollViewContentWidth = width * count + edge * (count + 1);
    
    self.backGroundView.contentSize =  CGSizeMake(scrollViewContentWidth, 0);
}

- (void)btnOnClick:(id)sender{
    YHLog(@"...");
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellSelectBtnClick)]) {
        [self.delegate cellSelectBtnClick];
    }
}

@end
