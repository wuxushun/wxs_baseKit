//
//  NSString+wxs_KeyValue.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_KeyValue)

/**
 JSON字符串转字典

 @return NSDictionary
 */
- (NSDictionary *)wxs_keyValue;

@end
