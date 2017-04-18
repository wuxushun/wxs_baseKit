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

@end
