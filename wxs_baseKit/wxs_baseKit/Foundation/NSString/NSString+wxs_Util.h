//
//  NSString+wxs_Util.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Util)

#pragma mark - 判断

/**
 判断URL中是否包含中文
 
 @return 是否包含中文
 */
- (BOOL)wxs_isContainChinese;

/**
 是否包含空格
 
 @return 是否包含空格
 */
- (BOOL)wxs_isContainBlank;

#pragma mark -- 类型判断


/**
 判断是否为空白字符串 (nil,NSNull,NULL, @"")

 @return YES即为是
 */
- (BOOL)isBlankString;

/**
 判断是否为数字

 @return YES即为是
 */
- (BOOL)isNumerals;

/**
 判断是否为整型

 @return YES即为是
 */
- (BOOL)isPureInt;


/**
 判断是否为浮点型

 @return YES即为是
 */
- (BOOL)isPureFloat;

#pragma mark - 操作

/**
 @brief 获取字符数量
 */
- (int)wxs_wordsCount;

/**
 是否包含字符串
 
 @param string 字符串
 
 @return YES, 包含;
 */
- (BOOL)wxs_containsaString:(NSString *)string;

/**
 Unicode编码的字符串转成NSString
 
 @return Unicode编码的字符串转成NSString
 */
- (NSString *)wxs_makeUnicodeToString;

@end
