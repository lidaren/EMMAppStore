//
//  EMMHomeTwoTableViewCell.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/24.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EMMHomeTwoTableViewCellDelegate <NSObject>
-(void)eMMHomeTwoTableViewCellSelectBtnClick;
@end
@interface EMMHomeTwoTableViewCell : UITableViewCell
@property (nonatomic, assign) id <EMMHomeTwoTableViewCellDelegate> delegate;
@end
