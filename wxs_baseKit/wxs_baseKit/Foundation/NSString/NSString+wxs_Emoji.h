//
//  NSString+wxs_Emoji.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Emoji)

#pragma mark -- Emoji判断

/**
 字符串是否为Emoji字符串
 (包含Unicode和CheatCodes)
 @return YES即为是
 */
- (BOOL)wxs_isEmoji;

/**
 字符串是否为Emoji Unicode字符串

 @return YES即为是
 */
- (BOOL)wxs_isEmojiWithUnicode;

/**
 字符串是否为Emoji CheatCodes字符串

 @return YES即为是
 */
- (BOOL)wxs_isEmojiWithCheatCodes;

/**
 字符串是否包含Emoji字符串

 @return YES即为包含
 */
- (BOOL)wxs_isIncludingEmoji;

#pragma mark - Emoji操作

/**
 移除Emoji字符

 @return 移除后的字符串
 */
- (NSString *)wxs_removedEmojiString;

#pragma mark -- CheatCodes 与 Unicode 的转换

/**
 将Emoji 特征码 转换为unicode码
 (通常用于服务器返回带Emoji表情的字符串用以本地显示)
 @return 转换后的字符串
 */
- (NSString *)wxs_stringByReplacingEmojiCheatCodesWithUnicode;

/**
 将Emoji unicode码 特征码
 (通常用于本地带Emoji表情的字符串提交给服务器时使用)
 @return 转换后的字符串
 */
- (NSString *)wxs_stringByReplacingEmojiUnicodeWithCheatCodes;

@end
