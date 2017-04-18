//
//  NSArray+wxs_SafeOperate.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSArray+wxs_SafeOperate.h"


@implementation NSArray (wxs_SafeOperate)

- (id)wxs_objectAtIndex:(NSUInteger)index
{
#ifdef DEBUG
    return self[index];
#else
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
#endif
}

- (NSString *)wxs_stringAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber*)wxs_numberAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)wxs_decimalNumberAtIndex:(NSUInteger)index{
    id value = [self wxs_objectAtIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)wxs_arrayAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)wxs_dictionaryAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)wxs_integerAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)wxs_unsignedIntegerAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)wxs_boolAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)wxs_int16AtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)wxs_int32AtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)wxs_int64AtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)wxs_charAtIndex:(NSUInteger)index{
    
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)wxs_shortAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)wxs_floatAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)wxs_doubleAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)wxs_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self wxs_objectAtIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

- (CGFloat)wxs_CGFloatAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)wxs_pointAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)wxs_sizeAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)wxs_rectAtIndex:(NSUInteger)index
{
    id value = [self wxs_objectAtIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}
@end

@implementation NSMutableArray (wxs_SafeOperate)

- (void)wxs_addObj:(id)val{
    if (val!=nil) {
        [self addObject:val];
    }
}
- (void)wxs_addString:(NSString *)val
{
    if (val!=nil) {
        [self addObject:val];
    }
}
- (void)wxs_addBool:(BOOL)val
{
    [self addObject:@(val)];
}
- (void)wxs_addInt:(int)val
{
    [self addObject:@(val)];
}
- (void)wxs_addInteger:(NSInteger)val
{
    [self addObject:@(val)];
}
- (void)wxs_addUnsignedInteger:(NSUInteger)val
{
    [self addObject:@(val)];
}
- (void)wxs_addCGFloat:(CGFloat)val
{
    [self addObject:@(val)];
}
- (void)wxs_addChar:(char)val
{
    [self addObject:@(val)];
}
- (void)wxs_addFloat:(float)val
{
    [self addObject:@(val)];
}
- (void)wxs_addPoint:(CGPoint)val
{
    [self addObject:NSStringFromCGPoint(val)];
}
- (void)wxs_addSize:(CGSize)val
{
    [self addObject:NSStringFromCGSize(val)];
}
- (void)wxs_addRect:(CGRect)val
{
    [self addObject:NSStringFromCGRect(val)];
}
@end

