//
//  UIColor+wxs_MakeImage.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "UIColor+wxs_MakeImage.h"
#import "UIColor+wxs_HexColor.h"

@implementation UIColor (wxs_MakeImage)

- (UIImage *)wxs_toImage
{
    return [UIColor wxs_imageWithColor:self];
}

- (UIImage *)wxs_toImageWithSize:(CGSize)size
{
    return [UIColor wxs_imageWithColor:self size:size];
}

+ (UIImage *)wxs_toImageWithHex:(long)hexColor
{
    return [self wxs_imageWithColor:[self wxs_colorWithHex:hexColor]];
}

+ (UIImage *)wxs_toImageWithHex:(long)hexColor size:(CGSize)size
{
    return [self wxs_imageWithColor:[self wxs_colorWithHex:hexColor] size:size];
}

+ (UIImage *)wxs_toImageWithHex:(long)hexColor alpha:(float)opacity
{
    return [self wxs_imageWithColor:[self wxs_colorWithHex:hexColor alpha:opacity]];
}

+ (UIImage *)wxs_toImageWithHex:(long)hexColor size:(CGSize)size alpha:(float)opacity
{
    return [self wxs_imageWithColor:[self wxs_colorWithHex:hexColor alpha:opacity] size:size];
}

+ (UIImage *)wxs_imageWithColor:(UIColor *)color
{
    return [self wxs_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)wxs_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
