//
//  NSDictionary+wxs_JSONString.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (wxs_JSONString)


/**
 转换为json字符串

 @return json字符串
 */
- (NSString *)wxs_JSONString;

@end
