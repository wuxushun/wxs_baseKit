//
//  NSData+wxs_Base64.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (wxs_Base64)

/**
 字符串base64后转data
 
 @param string 传入字符串
 
 @return 传入字符串 base64后的data
 */
+ (NSData *)wxs_dataWithBase64EncodedString:(NSString *)string;
/**
 @brief  NSData转string
 
 @param wrapWidth 换行长度  76  64
 
 @return base64后的字符串
 */
- (NSString *)wxs_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
/**
 NSData转string 换行长度默认64
 
 @return base64后的字符串
 */
- (NSString *)wxs_base64EncodedString;

@end
