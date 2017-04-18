//
//  NSString+wxs_UUID.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSString+wxs_UUID.h"
#import <UIKit/UIKit.h>

@implementation NSString (wxs_UUID)

+ (NSString *)wxs_UUID
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0)
    {
        return  [[NSUUID UUID] UUIDString];
    }
    else
    {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        return (__bridge_transfer NSString *)uuid;
    }
}

@end
