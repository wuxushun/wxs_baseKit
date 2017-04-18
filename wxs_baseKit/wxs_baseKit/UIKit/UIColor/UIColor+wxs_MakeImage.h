//
//  UIColor+wxs_MakeImage.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (wxs_MakeImage)

/**
 通过UIColor实例直接转为纯色图片
 
 @return UIImage实例
 */
- (UIImage *)wxs_toImage;

/**
 通过UIColor实例直接转为纯色图片、可设置尺寸
 
 @param size 图片尺寸
 @return UIImage实例
 */
- (UIImage *)wxs_toImageWithSize:(CGSize)size;

/**
 通过16进制色值直接转为纯色图片
 
 @param hexColor 16进制色值
 @return UIImage实例
 */
+ (UIImage *)wxs_toImageWithHex:(long)hexColor;

/**
 通过16进制色值直接转为纯色图片、可设置尺寸
 
 @param hexColor 16进制色值
 @param size 图片尺寸
 @return UIImage实例
 */
+ (UIImage *)wxs_toImageWithHex:(long)hexColor size:(CGSize)size;

+ (UIImage *)wxs_toImageWithHex:(long)hexColor alpha:(float)opacity;

+ (UIImage *)wxs_toImageWithHex:(long)hexColor size:(CGSize)size alpha:(float)opacity;

/**
 通过类方法将UIColor实例直接转为纯色图片
 
 @param color UIColor实例
 @return UIImage实例
 */
+ (UIImage *)wxs_imageWithColor:(UIColor *)color;

/**
 通过类方法将UIColor实例直接转为纯色图片、可设置尺寸
 
 @param color UIColor实例
 @param size 图片尺寸
 @return UIImage实例
 */
+ (UIImage *)wxs_imageWithColor:(UIColor *)color size:(CGSize)size;

@end
