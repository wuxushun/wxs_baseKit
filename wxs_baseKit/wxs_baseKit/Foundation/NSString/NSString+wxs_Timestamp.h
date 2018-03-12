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


/**
 根据datetime字符串获取毫秒级时间戳

 @return 时间戳
 */
+ (NSString *)wxs_msTimestampWithDateTimeString:(NSString *)dateTime;
+ (NSString *)wxs_msTimestampWithDateString:(NSString *)dateTime;
/**
 根据date获取毫秒级时间戳

 @param dateTime date
 @return 时间戳
 */
+ (NSString *)wxs_msTimestampWithDateTime:(NSDate *)dateTime;


/**
 根据时间戳获取date

 @param msTimestamp 时间戳
 @return date
 */
+ (NSDate *)wxs_dateTimeWithmsTimestamp:(NSString *)msTimestamp;

/**
 根据时间戳获取时间字符串

 @param msTimestamp 时间戳
 @param string 分割字符串
 @return datetime
 */
+ (NSString *)wxs_dateTimeStringWithmsTimestamp:(NSString *)msTimestamp
                       ComponentsJoinedByString:(NSString *)string;

/**
 根据时间戳获取时间字符串
 
 @param msTimestamp 时间戳
 @return datetime
 */
+ (NSString *)wxs_dateTimeStringWithmsTimestamp:(NSString *)msTimestamp;

/**
 根据时间戳获取日期字符串
 
 @param msTimestamp 时间戳
 @return date
 */
+ (NSString *)wxs_dateStringWithmsTimestamp:(NSString *)msTimestamp;
/**
 根据时间戳获取时间字符串
 
 @param msTimestamp 时间戳
 @return date
 */
+ (NSString *)wxs_timeStringWithmsTimestamp:(NSString *)msTimestamp;
/**
 根据时间戳获取时间字符串
 
 @param msTimestamp 时间戳
 @param string 分割字符串
 @return date
 */
+ (NSString *)wxs_dateStringWithmsTimestamp:(NSString *)msTimestamp
                   ComponentsJoinedByString:(NSString *)string;

@end
