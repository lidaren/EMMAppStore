//
//  Url_macro.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#ifndef Url_macro_h
#define Url_macro_h

#define BaseUrl @"http://estore-rest.keymobile.com.cn/"  // 地址

#define ImagesUrl @"http://estore-file.keymobile.com.cn/" // 所有图片的根目录

#define User_Get BaseUrl@"user/get" // 获取用户的基本信息
#define User_Auto BaseUrl@"user/auth" // 验证登录
// 获取首页数据
#define GetHome BaseUrl@"getHome"

// 获取应用分类列表
#define Category_List BaseUrl@"category/list"
// 根据应用ID获取应用的详细信息
#define Get_App_Information BaseUrl@"application/get"

/*** 应用列表 ***/
// 获取本人安装的应用
#define MyInstalled_App BaseUrl@"application/findMyInstalled"
// 获取本人安装的应用和收藏的应用
#define MyAllApp BaseUrl@"application/findMyAll"

/*** 搜索 ***/
// 根据分类ID搜索应用
#define Search_TypeID BaseUrl@"application/findByCategory"

/***  ***/
// 获取评论
#define Comment_List BaseUrl@"comment/list"
// 提交评论
#define Comment_Save BaseUrl@"comment/save"

#endif /* Url_macro_h */
