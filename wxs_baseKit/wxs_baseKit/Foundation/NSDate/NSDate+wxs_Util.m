//
//  NSDate+wxs_Util.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSDate+wxs_Util.h"
#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define wxs_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({ \
unsigned components;\
if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
}else{ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
} \
components; \
})\
_Pragma("clang diagnostic pop") \

#else
#define wxs_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({\
unsigned components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
components; \
})\
_Pragma("clang diagnostic pop") \

#endif

@implementation NSDate (Utilities)

// Courtesy of Lukasz Margielewski
// Updated via Holger Haenisch
+ (NSCalendar *) wxs_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *)wxs_dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] wxs_dateByAddingDays:days];
}

+ (NSDate *)wxs_dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] wxs_dateBySubtractingDays:days];
}

+ (NSDate *) wxs_dateTomorrow
{
    return [NSDate wxs_dateWithDaysFromNow:1];
}

+ (NSDate *) wxs_dateYesterday
{
    return [NSDate wxs_dateWithDaysBeforeNow:1];
}

+ (NSDate *) wxs_dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + wxs_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) wxs_dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - wxs_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) wxs_dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + wxs_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) wxs_dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - wxs_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) wxs_stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) wxs_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *) wxs_shortString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) wxs_shortTimeString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) wxs_shortDateString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) wxs_mediumString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) wxs_mediumTimeString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) wxs_mediumDateString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) wxs_longString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) wxs_longTimeString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) wxs_longDateString
{
    return [self wxs_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) wxs_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) wxs_wxs_isToday
{
    return [self wxs_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) wxs_isTomorrow
{
    return [self wxs_isEqualToDateIgnoringTime:[NSDate wxs_dateTomorrow]];
}

- (BOOL) wxs_isYesterday
{
    return [self wxs_isEqualToDateIgnoringTime:[NSDate wxs_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)wxs_isSameWeekAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.week != components2.week) return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < wxs_D_WEEK);
    
}

- (BOOL) wxs_isThisWeek
{
    return [self wxs_isSameWeekAsDate:[NSDate date]];
}

- (BOOL) wxs_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + wxs_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self wxs_isSameWeekAsDate:newDate];
}

- (BOOL) wxs_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - wxs_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self wxs_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL) wxs_isSameMonthAsDate: (NSDate *) aDate
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) wxs_isThisMonth
{
    return [self wxs_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL) wxs_isLastMonth
{
    return [self wxs_isSameMonthAsDate:[[NSDate date] wxs_dateBySubtractingMonths:1]];
}

- (BOOL) wxs_isNextMonth
{
    return [self wxs_isSameMonthAsDate:[[NSDate date] wxs_dateByAddingMonths:1]];
}

- (BOOL) wxs_isSameYearAsDate: (NSDate *) aDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit  fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return (components1.year == components2.year);
}

- (BOOL) wxs_isThisYear
{
    // Thanks, baspellis
    return [self wxs_isSameYearAsDate:[NSDate date]];
}

- (BOOL) wxs_isNextYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) wxs_isLastYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year - 1));
}

- (BOOL) wxs_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) wxs_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL) wxs_isInFuture
{
    return ([self wxs_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL) wxs_isInPast
{
    return ([self wxs_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) wxs_isTypicallyWeekend
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate wxs_currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitMonth fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate wxs_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) wxs_isTypicallyWorkday
{
    return ![self wxs_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *) wxs_dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) wxs_dateBySubtractingYears: (NSInteger) dYears
{
    return [self wxs_dateByAddingYears:-dYears];
}

- (NSDate *) wxs_dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) wxs_dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self wxs_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *) wxs_dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) wxs_dateBySubtractingDays: (NSInteger) dDays
{
    return [self wxs_dateByAddingDays: (dDays * -1)];
}

- (NSDate *) wxs_dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + wxs_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) wxs_dateBySubtractingHours: (NSInteger) dHours
{
    return [self wxs_dateByAddingHours: (dHours * -1)];
}

- (NSDate *) wxs_dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + wxs_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) wxs_dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self wxs_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) wxs_componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) wxs_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate wxs_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *) wxs_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    
    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate wxs_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) wxs_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / wxs_D_MINUTE);
}

- (NSInteger) wxs_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / wxs_D_MINUTE);
}

- (NSInteger) wxs_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / wxs_D_HOUR);
}

- (NSInteger) wxs_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / wxs_D_HOUR);
}

- (NSInteger) wxs_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / wxs_D_DAY);
}

- (NSInteger) wxs_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / wxs_D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)wxs_distanceDaysToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate wxs_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate wxs_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    
    return components.day;
}
- (NSInteger)wxs_distanceMonthsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate wxs_currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate wxs_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.month;
}
- (NSInteger)wxs_distanceYearsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate wxs_currentCalendar] components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.year;
}
#pragma mark Decomposing Dates
- (NSInteger)wxs_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + wxs_D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate wxs_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate wxs_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =  [[NSDate wxs_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}
- (NSInteger) wxs_hour
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.hour;
}

- (NSInteger) wxs_minute
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.minute;
}

- (NSInteger) wxs_seconds
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.second;
}

- (NSInteger) wxs_day
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.day;
}

- (NSInteger) wxs_month
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.month;
}

- (NSInteger) wxs_week
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger) wxs_weekday
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekday;
}

- (NSInteger) wxs_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger) wxs_year
{
    NSDateComponents *components = [[NSDate wxs_currentCalendar] components:wxs_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.year;
}

@end
