//
//  EMMUpdateTableViewCell.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/9.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EMMUpdateTableViewCellDelegate <NSObject>

- (void)reloadData:(UITableViewCell *)cell withHeight:(CGFloat)height;

@end

@interface EMMUpdateTableViewCell : UITableViewCell
@property (nonatomic,weak) id<EMMUpdateTableViewCellDelegate> delegate;
@end
