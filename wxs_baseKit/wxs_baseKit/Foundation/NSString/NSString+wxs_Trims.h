//
//  NSString+wxs_Trims.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Trims)

/**
 清除html标签
 
 @return 清除后的结果
 */
- (NSString *)wxs_stringByStrippingHTML;

/**
 清除js脚本
 
 @return 清楚js后的结果
 */
- (NSString *)wxs_stringByRemovingScriptsAndStrippingHTML;

/**
 去除首尾空格
 
 @return 去除首尾空格后的字符串
 */
- (NSString *)wxs_trimmingRoundWhitespace;

/**
 去除空格
 
 @return 去除空格后的字符串
 */
- (NSString *)wxs_trimmingWhitespace;

/**
 去除字符串空格与空行
 
 @return 去除字符串空格与空行的字符串
 */
- (NSString *)wxs_trimmingWhitespaceAndNewlines;

@end
