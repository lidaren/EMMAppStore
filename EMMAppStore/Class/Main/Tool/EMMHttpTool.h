//
//  EMMHttpTool.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//
//  网络请求类

#import <Foundation/Foundation.h>

@interface EMMHttpTool : NSObject
/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end
