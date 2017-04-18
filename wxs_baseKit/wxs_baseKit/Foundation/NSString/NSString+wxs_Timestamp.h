//
//  NSString+wxs_Timestamp.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Timestamp)

/**
 获取秒级时间戳

 @return 秒级时间戳
 */
+ (NSString *)wxs_Timestamp;

/**
 获取毫秒级时间戳

 @return 毫秒级时间戳
 */
+ (NSString *)wxs_msTimestamp;


@end
