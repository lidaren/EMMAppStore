//
//  EMMSearchResultsTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/14.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMSearchResultsTableViewCell.h"
#import "EMMDownLoadButton.h"

@interface EMMSearchResultsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *fileSize;
@property (weak, nonatomic) IBOutlet UIView *downLoadView;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation EMMSearchResultsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self creatBaseUI];
}

- (void)creatBaseUI{
    EMMDownLoadButton *emmDownloadButton = [EMMDownLoadButton show];
    [self.downLoadView addSubview:emmDownloadButton];
    
    CGRect frame = CGRectMake(0, 0, 130, 225);
    CGFloat space = 15;
    
    for (int i = 0; i < 4; i++) {
        if (i != 0) {
            frame.origin.x = frame.origin.x + frame.size.width + space;
        }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_yixin0%d", i+1]];
        [self.myScrollView addSubview:imageView];
    }
    
    CGSize scrollViewFrame = CGSizeMake(frame.origin.x + frame.size.width, 225);
    self.myScrollView.contentSize = scrollViewFrame;
    self.myScrollView.showsHorizontalScrollIndicator = NO;
}

@end
