//
//  EMMUserInfo.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface EMMUserInfo : NSObject

SingletonH(EMMUserInfo) // 创建单例
+ (void)clearUserInfo;  // 清空

@property (nonatomic, copy) NSString *xid; //用户的id

@property (nonatomic, assign) BOOL isThree; // 第三层
@end
