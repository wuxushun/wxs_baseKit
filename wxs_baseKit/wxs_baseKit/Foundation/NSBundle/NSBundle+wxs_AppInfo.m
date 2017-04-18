//
//  NSBundle+wxs_AppInfo.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSBundle+wxs_AppInfo.h"
#import <sys/utsname.h>

@implementation NSBundle (wxs_AppInfo)

+ (NSString *)wxs_Version{
    NSDictionary *infoDictionary = [[self mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}
+ (NSInteger)wxs_Build{
    NSDictionary *infoDictionary = [[self mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}
+ (NSString *)wxs_Identifier{
    NSDictionary *infoDictionary = [[self mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}
+ (NSString *)wxs_CurrentLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages firstObject];
    return [NSString stringWithString:currentLanguage];
}

@end
