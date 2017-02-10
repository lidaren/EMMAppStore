//
//  EMMHomeOneTableViewCell.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/23.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 代理方法
 */
@protocol EMMHomeOneTableViewCellDelegate <NSObject>
-(void)cellSelectBtnClick;
@end

@interface EMMHomeOneTableViewCell : UITableViewCell
@property (nonatomic, assign) id <EMMHomeOneTableViewCellDelegate> delegate;
@end
