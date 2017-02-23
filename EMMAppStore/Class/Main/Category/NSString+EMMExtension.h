//
//  NSString+EMMExtension.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/23.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EMMExtension)

/**
 字符串版本号转正的计算方法
 例如：10.2.1 -> 10002001
 @param version 当前手机的版本号
 @return 返回一个整型的版本号
 */
+(NSInteger)version:(NSString *)version;
@end
