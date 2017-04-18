//
//  NSString+wxs_UUID.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_UUID)

/**
 获取随机 UUID 例如 E621E1F8-C36C-495A-93FC-0C247A3E6E5F
 
 @return 随机 UUID
 */
+ (NSString *)wxs_UUID;

@end
