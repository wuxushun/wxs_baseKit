//
//  NSDictionary+wxs_URL.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (wxs_URL)


/**
 将带参数url字符串装为NSDictionary

 @param query 带参数url字符串
 @return NSDictionary
 */
+ (NSDictionary *)wxs_dictionaryWithURLQuery:(NSString *)query;

/**
 将NSDictionary转换成url 参数字符串

 @return Url
 */
- (NSString *)wxs_URLQueryString;

@end
