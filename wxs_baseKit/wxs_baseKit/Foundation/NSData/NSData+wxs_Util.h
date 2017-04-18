//
//  NSData+wxs_Util.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (wxs_Util)

/**
 NSData 转成UTF8 字符串
 
 @return 转成UTF8 字符串
 */
- (NSString *)wxs_UTF8String;

@end
