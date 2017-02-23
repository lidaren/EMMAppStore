//
//  EMMApplicationModel.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/23.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMApplicationModel.h"

@implementation EMMApplicationModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id"
             };
}

- (void)setCellHeight:(CGFloat)cellHeight{
    
}

@end
