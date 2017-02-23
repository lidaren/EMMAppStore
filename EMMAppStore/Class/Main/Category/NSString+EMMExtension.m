//
//  NSString+EMMExtension.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/23.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "NSString+EMMExtension.h"

@implementation NSString (EMMExtension)
+(NSInteger)version:(NSString *)version{
    NSArray *array = [version componentsSeparatedByString:@"."];
    NSInteger versionNumber = 0;
    NSInteger arrayCount = array.count;
    if (arrayCount>0) {
        versionNumber += [array[0] integerValue] * 1000000;
    }
    if (arrayCount>1) {
        versionNumber += [array[1] integerValue] * 1000;
    }
    if (arrayCount>2) {
        versionNumber += [array[2] integerValue];
    }
    return versionNumber;
}
@end
