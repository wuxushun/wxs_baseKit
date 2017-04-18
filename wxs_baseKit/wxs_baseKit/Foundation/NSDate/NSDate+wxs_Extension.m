//
//  NSDate+wxs_Extension.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSDate+wxs_Extension.h"

@implementation NSDate (wxs_Extension)

- (NSUInteger)wxs_day {
    return [NSDate wxs_day:self];
}

- (NSUInteger)wxs_month {
    return [NSDate wxs_month:self];
}

- (NSUInteger)wxs_year {
    return [NSDate wxs_year:self];
}

- (NSUInteger)wxs_hour {
    return [NSDate wxs_hour:self];
}

- (NSUInteger)wxs_minute {
    return [NSDate wxs_minute:self];
}

- (NSUInteger)wxs_second {
    return [NSDate wxs_second:self];
}

+ (NSUInteger)wxs_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)wxs_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)wxs_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)wxs_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)wxs_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)wxs_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)wxs_daysInYear {
    return [NSDate wxs_daysInYear:self];
}

+ (NSUInteger)wxs_daysInYear:(NSDate *)date {
    return [self wxs_isLeapYear:date] ? 366 : 365;
}

- (BOOL)wxs_isLeapYear {
    return [NSDate wxs_isLeapYear:self];
}

+ (BOOL)wxs_isLeapYear:(NSDate *)date {
    NSUInteger year = [date wxs_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)wxs_formatYMD {
    return [NSDate wxs_formatYMD:self];
}

+ (NSString *)wxs_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date wxs_year],[date wxs_month], [date wxs_day]];
}

- (NSUInteger)wxs_weeksOfMonth {
    return [NSDate wxs_weeksOfMonth:self];
}

+ (NSUInteger)wxs_weeksOfMonth:(NSDate *)date {
    return [[date wxs_lastdayOfMonth] wxs_weekOfYear] - [[date wxs_begindayOfMonth] wxs_weekOfYear] + 1;
}

- (NSUInteger)wxs_weekOfYear {
    return [NSDate wxs_weekOfYear:self];
}

+ (NSUInteger)wxs_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date wxs_year];
    
    NSDate *lastdate = [date wxs_lastdayOfMonth];
    
    for (i = 1;[[lastdate wxs_dateAfterDay:-7 * i] wxs_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)wxs_dateAfterDay:(NSUInteger)day {
    return [NSDate wxs_dateAfterDate:self day:day];
}

+ (NSDate *)wxs_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)wxs_dateAfterMonth:(NSUInteger)month {
    return [NSDate wxs_dateAfterDate:self month:month];
}

+ (NSDate *)wxs_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)wxs_begindayOfMonth {
    return [NSDate wxs_begindayOfMonth:self];
}

+ (NSDate *)wxs_begindayOfMonth:(NSDate *)date {
    return [self wxs_dateAfterDate:date day:-[date wxs_day] + 1];
}

- (NSDate *)wxs_lastdayOfMonth {
    return [NSDate wxs_lastdayOfMonth:self];
}

+ (NSDate *)wxs_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self wxs_begindayOfMonth:date];
    return [[lastDate wxs_dateAfterMonth:1] wxs_dateAfterDay:-1];
}

- (NSUInteger)wxs_daysAgo {
    return [NSDate wxs_daysAgo:self];
}

+ (NSUInteger)wxs_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)wxs_weekday {
    return [NSDate wxs_weekday:self];
}

+ (NSInteger)wxs_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)wxs_dayFromWeekday {
    return [NSDate wxs_dayFromWeekday:self];
}

+ (NSString *)wxs_dayFromWeekday:(NSDate *)date {
    switch([date wxs_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)wxs_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)wxs_isToday {
    return [self wxs_isSameDay:[NSDate date]];
}

- (NSDate *)wxs_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)wxs_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)wxs_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date wxs_stringWithFormat:format];
}

- (NSString *)wxs_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)wxs_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)wxs_daysInMonth:(NSUInteger)month {
    return [NSDate wxs_daysInMonth:self month:month];
}

+ (NSUInteger)wxs_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date wxs_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)wxs_daysInMonth {
    return [NSDate wxs_daysInMonth:self];
}

+ (NSUInteger)wxs_daysInMonth:(NSDate *)date {
    return [self wxs_daysInMonth:date month:[date wxs_month]];
}

- (NSString *)wxs_timeInfo {
    return [NSDate wxs_timeInfoWithDate:self];
}

+ (NSString *)wxs_timeInfoWithDate:(NSDate *)date {
    return [self wxs_timeInfoWithDateString:[self wxs_stringWithDate:date format:[self wxs_ymdHmsFormat]]];
}

+ (NSString *)wxs_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self wxs_dateWithString:dateString format:[self wxs_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate wxs_month] - [date wxs_month]);
    int year = (int)([curDate wxs_year] - [date wxs_year]);
    int day = (int)([curDate wxs_day] - [date wxs_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate wxs_month] == 1 && [date wxs_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self wxs_daysInMonth:date month:[date wxs_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate wxs_day] + (totalDays - (int)[date wxs_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate wxs_month];
            int preMonth = (int)[date wxs_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)wxs_ymdFormat {
    return [NSDate wxs_ymdFormat];
}

- (NSString *)wxs_hmsFormat {
    return [NSDate wxs_hmsFormat];
}

- (NSString *)wxs_ymdHmsFormat {
    return [NSDate wxs_ymdHmsFormat];
}

+ (NSString *)wxs_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)wxs_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)wxs_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self wxs_ymdFormat], [self wxs_hmsFormat]];
}

- (NSDate *)wxs_offsetYears:(int)numYears {
    return [NSDate wxs_offsetYears:numYears fromDate:self];
}

+ (NSDate *)wxs_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)wxs_offsetMonths:(int)numMonths {
    return [NSDate wxs_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)wxs_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)wxs_offsetDays:(int)numDays {
    return [NSDate wxs_offsetDays:numDays fromDate:self];
}

+ (NSDate *)wxs_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)wxs_offsetHours:(int)hours {
    return [NSDate wxs_offsetHours:hours fromDate:self];
}

+ (NSDate *)wxs_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}


@end
