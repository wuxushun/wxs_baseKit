//
//  NSArray+wxs_Block.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSArray+wxs_Block.h"

@implementation NSArray (wxs_Block)

- (void)wxs_forEach:(void (^)(id object))block {
    if (!block) return;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)wxs_forEachWithIndex:(void (^)(id object, NSUInteger index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)wxs_filter:(BOOL (^)(id object))block {
    if (!block) return self;
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}

- (NSArray *)wxs_reject:(BOOL (^)(id object))block {
    if (!block) return self;
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return !block(evaluatedObject);
    }]];
}

@end
