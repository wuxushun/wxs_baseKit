//
//  NSDictionary+wxs_SaftOperate.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (wxs_SaftOperate)

- (BOOL)wxs_hasOwnKey:(NSString *)key;

- (NSString *)wxs_stringForKey:(NSString *)key;

- (NSNumber *)wxs_numberForKey:(NSString *)key;

- (NSDecimalNumber *)wxs_decimalNumberForKey:(NSString *)key;

- (NSArray *)wxs_arrayForKey:(NSString *)key;

- (NSDictionary *)wxs_dictionaryForKey:(NSString *)key;

- (NSInteger)wxs_integerForKey:(NSString *)key;

- (NSUInteger)wxs_unsignedIntegerForKey:(NSString *)key;

- (BOOL)wxs_boolForKey:(NSString *)key;

- (int16_t)wxs_int16ForKey:(NSString *)key;

- (int32_t)wxs_int32ForKey:(NSString *)key;

- (int64_t)wxs_int64ForKey:(NSString *)key;

- (char)wxs_charForKey:(NSString *)key;

- (short)wxs_shortForKey:(NSString *)key;

- (float)wxs_floatForKey:(NSString *)key;

- (double)wxs_doubleForKey:(NSString *)key;

- (long long)wxs_longLongForKey:(NSString *)key;

- (unsigned long long)wxs_unsignedLongLongForKey:(NSString *)key;

- (NSDate *)wxs_dateForKey:(NSString *)key dateFormat:(NSString *)dateFormat;

- (CGFloat)wxs_CGFloatForKey:(NSString *)key;

- (CGPoint)wxs_pointForKey:(NSString *)key;

- (CGSize)wxs_sizeForKey:(NSString *)key;

- (CGRect)wxs_rectForKey:(NSString *)key;

@end

@interface NSMutableDictionary (wxs_SaftOperate)

- (void)wxs_setObj:(id)val forKey:(NSString *)key;

- (void)wxs_setString:(NSString *)val forKey:(NSString *)key;

- (void)wxs_setBool:(BOOL)i forKey:(NSString *)key;

- (void)wxs_setInt:(int)i forKey:(NSString *)key;

- (void)wxs_setInteger:(NSInteger)i forKey:(NSString *)key;

- (void)wxs_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key;

- (void)wxs_setCGFloat:(CGFloat)f forKey:(NSString *)key;

- (void)wxs_setChar:(char)c forKey:(NSString *)key;

- (void)wxs_setFloat:(float)i forKey:(NSString *)key;

- (void)wxs_setDouble:(double)i forKey:(NSString *)key;

- (void)wxs_setLongLong:(long long)i forKey:(NSString *)key;

- (void)wxs_setPoint:(CGPoint)o forKey:(NSString *)key;

- (void)wxs_setSize:(CGSize)o forKey:(NSString *)key;

- (void)wxs_setRect:(CGRect)o forKey:(NSString *)key;

@end
