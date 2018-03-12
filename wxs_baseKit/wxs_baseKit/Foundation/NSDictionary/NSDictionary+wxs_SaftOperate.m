//
//  NSDictionary+wxs_SaftOperate.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSDictionary+wxs_SaftOperate.h"

@implementation NSDictionary (wxs_SaftOperate)

- (BOOL)wxs_hasOwnKey:(NSString *)key
{
    return [self objectForKey:key] != nil;
}

- (NSString *)wxs_stringForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null])
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

- (NSNumber *)wxs_numberForKey:(NSString *)key
{
    id value = [self objectForKey:key];
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

- (NSDecimalNumber *)wxs_decimalNumberForKey:(NSString *)key {
    id value = [self objectForKey:key];
    
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


- (NSArray *)wxs_arrayForKey:(NSString *)key
{
    id value = [self objectForKey:key];
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

- (NSDictionary *)wxs_dictionaryForKey:(NSString *)key
{
    id value = [self objectForKey:key];
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

- (NSInteger)wxs_integerForKey:(NSString *)key
{
    id value = [self objectForKey:key];
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
- (NSUInteger)wxs_unsignedIntegerForKey:(NSString *)key{
    id value = [self objectForKey:key];
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
- (BOOL)wxs_boolForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (int16_t)wxs_int16ForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (int32_t)wxs_int32ForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (int64_t)wxs_int64ForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (char)wxs_charForKey:(NSString *)key{
    id value = [self objectForKey:key];
    
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
- (short)wxs_shortForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (float)wxs_floatForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (double)wxs_doubleForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    
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
- (long long)wxs_longLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)wxs_unsignedLongLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (NSDate *)wxs_dateForKey:(NSString *)key dateFormat:(NSString *)dateFormat{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

- (CGFloat)wxs_CGFloatForKey:(NSString *)key
{
    CGFloat f = [self[key] doubleValue];
    return f;
}

- (CGPoint)wxs_pointForKey:(NSString *)key
{
    CGPoint point = CGPointFromString(self[key]);
    return point;
}
- (CGSize)wxs_sizeForKey:(NSString *)key
{
    CGSize size = CGSizeFromString(self[key]);
    return size;
}
- (CGRect)wxs_rectForKey:(NSString *)key
{
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}

@end

@implementation NSMutableDictionary (wxs_SaftOperate)

- (void)wxs_setObj:(id)val forKey:(NSString *)key{
#ifdef DEBUG
    return [self setObject:val forKey:key];
#else
    if (val && key) {
        self[key] = val;
    }
#endif
}
- (void)wxs_setObjSafty:(id)val forKey:(NSString *)key
{
    if (val && key) {
        self[key] = val;
    }
}
- (void)wxs_setString:(NSString *)val forKey:(NSString *)key;
{
#ifdef DEBUG
    [self setObject:val forKey:key];
#else
    if (val && key) {
        [self setObject:val forKey:key];
    }
#endif
}
- (void)wxs_setBool:(BOOL)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setInt:(int)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setInteger:(NSInteger)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setCGFloat:(CGFloat)f forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(f);
#else
    if (key) {
        self[key] = @(f);
    }
#endif
}
- (void)wxs_setChar:(char)c forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(c);
#else
    if (key) {
        self[key] = @(c);
    }
#endif
}
- (void)wxs_setFloat:(float)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setDouble:(double)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setLongLong:(long long)i forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = @(i);
#else
    if (key) {
        self[key] = @(i);
    }
#endif
}
- (void)wxs_setPoint:(CGPoint)o forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = NSStringFromCGPoint(o);
#else
    if (key) {
        self[key] = NSStringFromCGPoint(o);
    }
#endif
}
- (void)wxs_setSize:(CGSize)o forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = NSStringFromCGSize(o);
#else
    if (key) {
        self[key] = NSStringFromCGSize(o);
    }
#endif
}
- (void)wxs_setRect:(CGRect)o forKey:(NSString *)key
{
#ifdef DEBUG
    self[key] = NSStringFromCGRect(o);
#else
    if (key) {
        self[key] = NSStringFromCGRect(o);
    }
#endif
}

@end
