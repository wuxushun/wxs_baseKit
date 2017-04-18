//
//  NSBundle+wxs_AppInfo.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (wxs_AppInfo)

/**
 获取app版本

 @return 版本字符串
 */
+ (NSString *)wxs_Version;

/**
 获取编译版本

 @return 编译版本
 */
+ (NSInteger)wxs_Build;

/**
 获取BundleIdentifier

 @return BundleIdentifier
 */
+ (NSString *)wxs_Identifier;

/**
 获取当前语言

 @return 当前语言
 */
+ (NSString *)wxs_CurrentLanguage;

@end
