//
//  UIColor+wxs_Gradient.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (wxs_Gradient)

/**
 渐变颜色
 
 @param c1     开始颜色
 @param c2     结束颜色
 @param height 渐变高度
 
 @return 渐变颜色
 */
+ (UIColor *)wxs_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

@end
