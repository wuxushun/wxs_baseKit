//
//  NSString+wxs_Size.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (wxs_Size)


/**
 计算文字高度

 @param font 文字实体
 @param width 约束宽度
 @return 结果
 */
- (CGFloat)wxs_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

/**
 计算文字宽度

 @param font 文字实体
 @param height 约束高度
 @return 结果
 */
- (CGFloat)wxs_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 计算文字尺寸

 @param font 文字实体
 @param width 文字宽度
 @return 结果
 */
- (CGSize)wxs_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 计算文字宽度
 
 @param font 文字实体
 @param height 约束宽度
 @return 结果
 */
- (CGSize)wxs_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

@end
