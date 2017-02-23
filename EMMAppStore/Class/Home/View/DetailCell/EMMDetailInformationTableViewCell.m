//
//  EMMDetailInformationTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/14.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDetailInformationTableViewCell.h"
#import "EMMApplicationModel.h"

@interface EMMDetailInformationTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleName;     // 标题
@property (weak, nonatomic) IBOutlet UITextView *myTextView; // 介绍
@end

@implementation EMMDetailInformationTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.myTextView.editable = NO;
    self.myTextView.userInteractionEnabled = NO;
}
- (void)setInfo:(EMMApplicationModel *)model{
    self.myTextView.text = model.summary;
}
@end
