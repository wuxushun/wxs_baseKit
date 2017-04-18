//
//  NSDate+wxs_Util.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define wxs_D_MINUTE	60
#define wxs_D_HOUR	3600
#define wxs_D_DAY	86400
#define wxs_D_WEEK	604800
#define wxs_D_YEAR	31556926
@interface NSDate (wxs_Util)

/**
 获取当前日历

 @return 当前日历
 */
+ (NSCalendar *)wxs_currentCalendar; // avoid bottlenecks

#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger wxs_nearestHour;
@property (readonly) NSInteger wxs_hour;
@property (readonly) NSInteger wxs_minute;
@property (readonly) NSInteger wxs_seconds;
@property (readonly) NSInteger wxs_day;
@property (readonly) NSInteger wxs_month;
@property (readonly) NSInteger wxs_week;
@property (readonly) NSInteger wxs_weekday;
@property (readonly) NSInteger wxs_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger wxs_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *wxs_shortString;
@property (nonatomic, readonly) NSString *wxs_shortDateString;
@property (nonatomic, readonly) NSString *wxs_shortTimeString;
@property (nonatomic, readonly) NSString *wxs_mediumString;
@property (nonatomic, readonly) NSString *wxs_mediumDateString;
@property (nonatomic, readonly) NSString *wxs_mediumTimeString;
@property (nonatomic, readonly) NSString *wxs_longString;
@property (nonatomic, readonly) NSString *wxs_longDateString;
@property (nonatomic, readonly) NSString *wxs_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)wxs_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)wxs_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)wxs_dateTomorrow;
///昨天
+ (NSDate *)wxs_dateYesterday;
///今天后几天
+ (NSDate *)wxs_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)wxs_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)wxs_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)wxs_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)wxs_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)wxs_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)wxs_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)wxs_isToday;
///是否是明天
- (BOOL)wxs_isTomorrow;
///是否是昨天
- (BOOL)wxs_isYesterday;

///是否是同一周
- (BOOL)wxs_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)wxs_isThisWeek;
///是否是本周的下周
- (BOOL)wxs_isNextWeek;
///是否是本周的上周
- (BOOL)wxs_isLastWeek;

///是否是同一月
- (BOOL)wxs_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)wxs_isThisMonth;
///是否是本月的下月
- (BOOL)wxs_isNextMonth;
///是否是本月的上月
- (BOOL)wxs_isLastMonth;

///是否是同一年
- (BOOL)wxs_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)wxs_isThisYear;
///是否是今年的下一年
- (BOOL)wxs_isNextYear;
///是否是今年的上一年
- (BOOL)wxs_isLastYear;

///是否提前aDate
- (BOOL)wxs_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)wxs_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)wxs_isInFuture;
///是否晚是过去
- (BOOL)wxs_isInPast;


///是否是工作日
- (BOOL)wxs_isTypicallyWorkday;
///是否是周末
- (BOOL)wxs_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)wxs_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)wxs_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)wxs_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)wxs_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)wxs_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)wxs_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)wxs_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)wxs_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)wxs_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)wxs_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)wxs_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)wxs_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)wxs_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)wxs_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)wxs_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)wxs_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)wxs_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)wxs_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)wxs_distanceYearsToDate:(NSDate *)anotherDate;

@end
