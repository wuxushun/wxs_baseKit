//
//  NSArray+wxs_SafeOperate.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (wxs_SafeOperate)


/**
 DEBUG模式下不做安全处理，以便于找出bug

 @param index 索引
 @return 实体
 */
- (id)wxs_objectAtIndex:(NSUInteger)index;

#pragma make -- 以下指定返回类型以便于直接调用

- (NSString *)wxs_stringAtIndex:(NSUInteger)index;

- (NSNumber *)wxs_numberAtIndex:(NSUInteger)index;

- (NSDecimalNumber *)wxs_decimalNumberAtIndex:(NSUInteger)index;

- (NSArray *)wxs_arrayAtIndex:(NSUInteger)index;

- (NSDictionary*)wxs_dictionaryAtIndex:(NSUInteger)index;

- (NSInteger)wxs_integerAtIndex:(NSUInteger)index;

- (NSUInteger)wxs_unsignedIntegerAtIndex:(NSUInteger)index;

- (BOOL)wxs_boolAtIndex:(NSUInteger)index;

- (int16_t)wxs_int16AtIndex:(NSUInteger)index;

- (int32_t)wxs_int32AtIndex:(NSUInteger)index;

- (int64_t)wxs_int64AtIndex:(NSUInteger)index;

- (char)wxs_charAtIndex:(NSUInteger)index;

- (short)wxs_shortAtIndex:(NSUInteger)index;

- (float)wxs_floatAtIndex:(NSUInteger)index;

- (double)wxs_doubleAtIndex:(NSUInteger)index;

- (NSDate *)wxs_dateAtIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;

- (CGFloat)wxs_CGFloatAtIndex:(NSUInteger)index;

- (CGPoint)wxs_pointAtIndex:(NSUInteger)index;

- (CGSize)wxs_sizeAtIndex:(NSUInteger)index;

- (CGRect)wxs_rectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (wxs_SafeOperate)

-(void)wxs_addObj:(id)val;

-(void)wxs_addString:(NSString*)val;

-(void)wxs_addBool:(BOOL)val;

-(void)wxs_addInt:(int)val;

-(void)wxs_addInteger:(NSInteger)val;

-(void)wxs_addUnsignedInteger:(NSUInteger)val;

-(void)wxs_addCGFloat:(CGFloat)val;

-(void)wxs_addChar:(char)val;

-(void)wxs_addFloat:(float)val;

-(void)wxs_addPoint:(CGPoint)val;

-(void)wxs_addSize:(CGSize)val;

-(void)wxs_addRect:(CGRect)val;

@end
