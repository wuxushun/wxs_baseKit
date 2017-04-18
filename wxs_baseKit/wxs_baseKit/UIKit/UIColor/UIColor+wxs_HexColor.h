//
//  UIColor+wxs_HexColor.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/5.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (wxs_HexColor)

#pragma mark --色值

/**
 16进制色值

 @param hexColor 色值
 @return UIColor实体
 */
+ (UIColor *)wxs_colorWithHex:(long)hexColor;

/**
  16进制色值

 @param hexColor 色值
 @param opacity 透明度
 @return UIColor实体
 */
+ (UIColor *)wxs_colorWithHex:(long)hexColor alpha:(float)opacity;

/**
 根据UIColor获取16进制色值

 @param color UIColor实体
 @return 16进制色值字符串
 */
+ (NSString *)wxs_hexFromUIColor: (UIColor *)color;




@end
