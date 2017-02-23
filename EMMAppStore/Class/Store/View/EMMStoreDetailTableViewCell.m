//
//  EMMStoreDetailTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/22.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMStoreDetailTableViewCell.h"
#import "EMMStoreDetailModel.h"

@interface EMMStoreDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *size;
@property (weak, nonatomic) IBOutlet UILabel *detailName;

@end

@implementation EMMStoreDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setData:(EMMStoreDetailModel*)storeData{
    [self.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ImagesUrl, storeData.icon]]];
    self.name.text = storeData.name;
    self.detailName.text = storeData.tip;
    self.size.text = [NSString stringWithFormat:@"%@M", storeData.length];
}

@end
