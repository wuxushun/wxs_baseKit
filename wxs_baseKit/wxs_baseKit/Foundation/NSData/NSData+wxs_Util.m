//
//  NSData+wxs_Util.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSData+wxs_Util.h"

@implementation NSData (wxs_Util)

- (NSString *)wxs_UTF8String{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end
