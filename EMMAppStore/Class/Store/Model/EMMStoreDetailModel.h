//
//  EMMStoreDetailModel.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/22.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMMStoreDetailModel : NSObject
@property (nonatomic, copy) NSString *identifier; // 应用唯一标识符
@property (nonatomic, copy) NSString *total;  // 安装总人数
@property (nonatomic, copy) NSString *name;  // 应用名称
@property (nonatomic, copy) NSString *icon;  // 缩略图
@property (nonatomic, copy) NSString *length;  //文件大小
@property (nonatomic, copy) NSString *tip;  // 一句话介绍
@property (nonatomic, copy) NSString *ID;  // 应用编号
@property (nonatomic, copy) NSString *pack; // 程序包文件名或者html5的url


// ***************************** json ************************
/*
 {"code":200,"data":[{"identifier":"com.zyy.bb","total":0,"name":"宝宝爱拍照","icon":"1487302841038.png","length":0,"tip":"宝宝爱拍照是一款记录宝宝成长相册的应用","id":"58abaf58f6731f056a5ea049","pack":"1487646541644.apk"}]}
 */

@end
