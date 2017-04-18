//
//  NSArray+wxs_Block.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (wxs_Block)

/**
 forEach

 @param block callback
 */
- (void)wxs_forEach:(void (^)(id object))block;

/**
 带index的forEach

 @param block callback
 */
- (void)wxs_forEachWithIndex:(void (^)(id object, NSUInteger index))block;

/**
 数组过滤器

 @param block callback
 @return 过滤后数组
 */
- (NSArray *)wxs_filter:(BOOL (^)(id object))block;

/**
 反向过滤器

 @param block callback
 @return 反过滤后数组
 */
- (NSArray *)wxs_reject:(BOOL (^)(id object))block;

@end
