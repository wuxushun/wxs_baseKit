//
//  NSString+wxs_Pinyin.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSString+wxs_Pinyin.h"

@implementation NSString (wxs_Pinyin)

- (NSString*)wxs_pinyinWithPhoneticSymbol{
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformMandarinLatin, NO);
    return pinyin;
}

- (NSString*)wxs_pinyin{
    NSMutableString *pinyin = [NSMutableString stringWithString:[self wxs_pinyinWithPhoneticSymbol]];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformStripCombiningMarks, NO);
    return pinyin;
}

- (NSArray*)wxs_pinyinArray{
    NSArray *array = [[self wxs_pinyin] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
}

- (NSString*)wxs_pinyinWithoutBlank{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self wxs_pinyinArray]) {
        [string appendString:str];
    }
    return string;
}

- (NSArray*)wxs_pinyinInitialsArray{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self wxs_pinyinArray]) {
        if ([str length] > 0) {
            [array addObject:[str substringToIndex:1]];
        }
    }
    return array;
}

- (NSString*)wxs_pinyinInitialsString{
    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self wxs_pinyinArray]) {
        if ([str length] > 0) {
            [pinyin appendString:[str substringToIndex:1]];
        }
    }
    return pinyin;
}

@end
