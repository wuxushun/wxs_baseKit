//
//  NSDate+wxs_Extension.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (wxs_Extension)

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)wxs_day;
- (NSUInteger)wxs_month;
- (NSUInteger)wxs_year;
- (NSUInteger)wxs_hour;
- (NSUInteger)wxs_minute;
- (NSUInteger)wxs_second;
+ (NSUInteger)wxs_day:(NSDate *)date;
+ (NSUInteger)wxs_month:(NSDate *)date;
+ (NSUInteger)wxs_year:(NSDate *)date;
+ (NSUInteger)wxs_hour:(NSDate *)date;
+ (NSUInteger)wxs_minute:(NSDate *)date;
+ (NSUInteger)wxs_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)wxs_daysInYear;
+ (NSUInteger)wxs_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)wxs_isLeapYear;
+ (BOOL)wxs_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)wxs_weekOfYear;
+ (NSUInteger)wxs_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)wxs_formatYMD;
+ (NSString *)wxs_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)wxs_weeksOfMonth;
+ (NSUInteger)wxs_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)wxs_begindayOfMonth;
+ (NSDate *)wxs_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)wxs_lastdayOfMonth;
+ (NSDate *)wxs_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)wxs_dateAfterDay:(NSUInteger)day;
+ (NSDate *)wxs_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)wxs_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)wxs_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)wxs_offsetYears:(int)numYears;
+ (NSDate *)wxs_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)wxs_offsetMonths:(int)numMonths;
+ (NSDate *)wxs_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)wxs_offsetDays:(int)numDays;
+ (NSDate *)wxs_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)wxs_offsetHours:(int)hours;
+ (NSDate *)wxs_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)wxs_daysAgo;
+ (NSUInteger)wxs_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)wxs_weekday;
+ (NSInteger)wxs_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)wxs_dayFromWeekday;
+ (NSString *)wxs_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)wxs_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)wxs_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)wxs_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)wxs_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)wxs_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)wxs_stringWithFormat:(NSString *)format;
+ (NSDate *)wxs_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)wxs_daysInMonth:(NSUInteger)month;
+ (NSUInteger)wxs_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)wxs_daysInMonth;
+ (NSUInteger)wxs_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)wxs_timeInfo;
+ (NSString *)wxs_timeInfoWithDate:(NSDate *)date;
+ (NSString *)wxs_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)wxs_ymdFormat;
- (NSString *)wxs_hmsFormat;
- (NSString *)wxs_ymdHmsFormat;
+ (NSString *)wxs_ymdFormat;
+ (NSString *)wxs_hmsFormat;
+ (NSString *)wxs_ymdHmsFormat;

@end
