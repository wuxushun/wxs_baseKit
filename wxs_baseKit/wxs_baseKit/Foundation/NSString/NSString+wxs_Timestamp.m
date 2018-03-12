//
//  NSString+wxs_Timestamp.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSString+wxs_Timestamp.h"

@implementation NSString (wxs_Timestamp)

+ (NSString *)wxs_Timestamp
{
    return  [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]] stringValue];
}

+ (NSString *)wxs_msTimestamp
{
    return  [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000] stringValue];
}

+ (NSString *)wxs_msTimestampWithDateTimeString:(NSString *)dateTime
{
    NSDate *date = [NSDate wxs_dateWithString:dateTime format:@"yyyy-MM-dd HH:mm:ss"];
    
    return  [[NSNumber numberWithLongLong:[date timeIntervalSince1970]*1000] stringValue];
}

+ (NSString *)wxs_msTimestampWithDateString:(NSString *)dateTime
{
    NSDate *date = [NSDate wxs_dateWithString:dateTime format:@"yyyy-MM-dd"];
    
    return  [[NSNumber numberWithLongLong:[date timeIntervalSince1970]*1000] stringValue];
}

+ (NSString *)wxs_msTimestampWithDateTime:(NSDate *)dateTime
{
    return  [[NSNumber numberWithLongLong:[dateTime timeIntervalSince1970]*1000] stringValue];
}

+ (NSDate *)wxs_dateTimeWithmsTimestamp:(NSString *)msTimestamp
{
    NSTimeInterval time = [msTimestamp longLongValue] / 1000;
    return [NSDate dateWithTimeIntervalSince1970:time];
}

+ (NSString *)wxs_dateTimeStringWithmsTimestamp:(NSString *)msTimestamp
                       ComponentsJoinedByString:(NSString *)string
{
    if(![NSString wxs_isBlankString:msTimestamp]){
        NSDate *date = [self wxs_dateTimeWithmsTimestamp:msTimestamp];
        NSString *format = [NSString stringWithFormat:@"yyyy%@MM%@dd HH:mm:ss",string,string];
        return [NSDate wxs_stringWithDate:date format:format];
    }
    return @"";
}

+ (NSString *)wxs_dateTimeStringWithmsTimestamp:(NSString *)msTimestamp
{
    if(![NSString wxs_isBlankString:msTimestamp]){
        NSDate *date = [self wxs_dateTimeWithmsTimestamp:msTimestamp];
        return [NSDate wxs_stringWithDate:date format:@"yyyy/MM/dd HH:mm:ss"];
    }
    return @"";
}

+ (NSString *)wxs_dateStringWithmsTimestamp:(NSString *)msTimestamp
{
    if(![NSString wxs_isBlankString:msTimestamp]){
        NSDate *date = [self wxs_dateTimeWithmsTimestamp:msTimestamp];
        return [NSDate wxs_stringWithDate:date format:@"yyyy/MM/dd"];
    }
    return @"";
    
}

+ (NSString *)wxs_timeStringWithmsTimestamp:(NSString *)msTimestamp
{
    if(![NSString wxs_isBlankString:msTimestamp]){
        NSDate *date = [self wxs_dateTimeWithmsTimestamp:msTimestamp];
        return [NSDate wxs_stringWithDate:date format:@"HH:mm:ss"];
    }
    return @"";
}

+ (NSString *)wxs_dateStringWithmsTimestamp:(NSString *)msTimestamp
                   ComponentsJoinedByString:(NSString *)string
{
    if(![NSString wxs_isBlankString:msTimestamp]){
        NSDate *date = [self wxs_dateTimeWithmsTimestamp:msTimestamp];
        NSString *format = [NSString stringWithFormat:@"yyyy%@MM%@dd",string,string];
        return [NSDate wxs_stringWithDate:date format:format];
    }
    return @"";
}

@end
