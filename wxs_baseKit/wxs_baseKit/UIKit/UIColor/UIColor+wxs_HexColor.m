//
//  UIColor+wxs_HexColor.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/5.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "UIColor+wxs_HexColor.h"

@implementation UIColor (wxs_HexColor)

+ (UIColor *)wxs_colorWithHex:(long)hexColor;
{
    return [UIColor wxs_colorWithHex:hexColor alpha:1.f];
}

+ (UIColor *)wxs_colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (NSString *)wxs_hexFromUIColor:(UIColor *)color
{
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%d%d%d", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}
@end
