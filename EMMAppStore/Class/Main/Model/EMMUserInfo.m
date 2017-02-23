//
//  EMMUserInfo.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMUserInfo.h"

@implementation EMMUserInfo

SingletonM(EMMUserInfo)

+ (void)clearUserInfo{
    _instace = nil;
}
@end
