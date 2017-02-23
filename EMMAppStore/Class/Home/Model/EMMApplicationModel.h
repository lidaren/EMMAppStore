//
//  EMMApplicationModel.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/23.
//  Copyright © 2017年 GZYY. All rights reserved.
//
//  应用的详细信息

#import <Foundation/Foundation.h>

@interface EMMApplicationModel : NSObject

/*
 *  PLATFORM_ANDROID  0
 *  PLATFORM_HTML5    3
 */

/**
* 应用名称
*/
@property (nonatomic, copy) NSString *name;
/**
* 简介
*/
@property (nonatomic, copy) NSString *summary;
/**
 * android程序package名称
 */
@property (nonatomic, copy) NSString *identifier;
/**
 * 图片
 */
@property (nonatomic, copy) NSString *icon;
/**
 * 文件大小
 */
@property (nonatomic, assign) long length;
/**
 * 当前版本介绍
 */
@property (nonatomic, copy) NSString *readme;
/**
 * 版本
 */
@property (nonatomic, copy) NSString *version;
/**
 * 程序包文件名或者html5的url
 */
@property (nonatomic, copy) NSString *pack;
/**
 * 屏幕截图
 */
@property (nonatomic, strong) NSArray *screenshots;
/**
 * 类型,android和html5
 */
@property (nonatomic, assign) int platform;
/**
 * 开发者
 */
@property (nonatomic, copy) NSString *developer;
/**
 * 应用ID
 */
@property (nonatomic, copy) NSString *ID;
/**
 * 发布时间
 */
@property (nonatomic, copy) NSString *time;
/**
 * 所属分类
 */
@property (nonatomic, copy) NSString *category;
/**
 * 兼容性
 */
@property (nonatomic, copy) NSString *compatibility;
/**
 * 开发者ID
 */
@property (nonatomic, copy) NSString *did;

@property (nonatomic, assign) CGFloat cellHeight; // 文字的高度


// ************************************ 返回的json ************************************
/*
 {"code":200,"data":{"summary":"【一家人分享宝宝成长的喜悦】\u003cbr/\u003e家庭成员共同记录宝宝成长点滴\u003cbr/\u003e照片+文字，满足记录宝宝成长故事的需求\u003cbr/\u003e\u003cbr/\u003e【智能整理照片，便捷的发布流程】\u003cbr/\u003e根据时间自动归类整理，讲述生活故事\u003cbr/\u003e裁剪、美化、备注一步到位\u003cbr/\u003e\u003cbr/\u003e【即时同步】\u003cbr/\u003e新发布内容，亲友都可以收到通知\u003cbr/\u003e即使不在宝宝身边，也能陪伴宝宝成长\u003cbr/\u003e\u003cbr/\u003e【私密空间】\u003cbr/\u003e只有通过授权添加，才能成为宝宝亲人\u003cbr/\u003e亲人才能进入宝宝的私密空间，分享照片\u003cbr/\u003e\u003cbr/\u003e【亲友邀请】\u003cbr/\u003e轻松邀请亲友加入宝宝爱拍照\u003cbr/\u003e一起分享宝宝成长历程\u003cbr/\u003e","identifier":"com.zyy.bb","icon":"1487302841038.png","length":0,"readme":"1.0.3\u003cbr/\u003e应用主要的特色：\u003cbr/\u003e1）以家庭亲友为单位，支持多人共同记录宝宝的成长历程；\u003cbr/\u003e2）可从手机通讯录添加宝宝亲友、设置权限；\u003cbr/\u003e3）支持发布手机照片/拍照发布，智能整理照片；\u003cbr/\u003e4）可针对每张图片单独裁剪、美化、添加备注；\u003cbr/\u003e5）便捷的评论、点赞互动功能。","version":"1.0.3","pack":"1487646541644.apk","screenshots":["1487302846123.jpg","1487302852831.jpg","1487302855138.jpg","1487302848586.jpg","1487302844108.jpg"],"platform":0,"name":"宝宝爱拍照","developer":"广州飞鱼科技","id":"58abaf58f6731f056a5ea049","time":"2017年02月21日","category":"基础服务","compatibility":"Android4.0.4","did":"589d293ff6731f06fdaffe66"}}
 */

@end
