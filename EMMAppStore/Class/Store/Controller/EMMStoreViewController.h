//
//  EMMStoreViewController.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMMStoreViewController : UIViewController

@end

@interface CategoryListData : NSObject
@property (nonatomic, copy) NSString *ID; // 分类ID
@property (nonatomic, copy) NSString *name; // 分类名称
@end
