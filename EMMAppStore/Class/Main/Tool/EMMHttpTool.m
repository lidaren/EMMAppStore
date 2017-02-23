//
//  EMMHttpTool.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMHttpTool.h"

@implementation EMMHttpTool
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 2.发送GET请求
    [mgr GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr.requestSerializer setValue:[EMMUserInfo sharedEMMUserInfo].xid forHTTPHeaderField:@"xid"]; // 设置请求头
    
    // 2.发送POST请求
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * task, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
