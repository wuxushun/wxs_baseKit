//
//  UIDevice+wxs_baseKit.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/5.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (wxs_baseKit)

#pragma mark --设备判断

/**
 判断设备是否为iPad

 @return YES即为iPad
 */
+ (BOOL)wxs_isiPad;

/**
 判断设备是否为iPhone

 @return YES即为iPhone
 */
+ (BOOL)wxs_isiPhone;

/**
 判断设备是否为iPod

 @return YES即为iPod
 */
+ (BOOL)wxs_isiPod;

/**
 判断设备是否为模拟器

 @return YES即为模拟器
 */
+ (BOOL)wxs_isSimulator;

/**
 判断设备是否为Retina屏

 @return YES即为Retina屏
 */
+ (BOOL)wxs_isRetina;

/**
 判断设备是否为Retina HD屏
 
 @return YES即为Retina HD屏
 */
+ (BOOL)wxs_isRetinaHD;

/**
 当前设备是否有摄像头

 @return YES即为有摄像头
 */
+ (BOOL)wxs_hasCamera;

#pragma mark --设备信息

/**
 设备平台类型
 例如:"iPhone3,2"
 
 @return 设备平台类型
 */
+ (NSString *)wxs_devicePlatform;

/**
 根据系统平台类型获取设备名
 例如:"iPhone 4"
 
 @return 设备名字符串
 */
+ (NSString *)wxs_devicePlatformString;

/**
 获取当前设备名称

 @return 当前设备名称
 */
+ (NSString *)wxs_deviceName;

/**
 获取设备iOS版本号

 @return 版本号字符串
 */
+ (NSString *)wxs_iOSVersion;

/**
 获取当前设备cpu主频

 @return 当前设备cpu主频
 */
+ (NSUInteger)wxs_cpuFrequency;

/**
 获取当前设备总线带宽

 @return 当前设备总线带宽
 */
+ (NSUInteger)wxs_busFrequency;

/**
 获取当前设备物理内存大小

 @return 当前设备物理内存大小
 */
+ (NSUInteger)wxs_ramSize;

/**
 获取当前设备cpu核数

 @return 当前设备cpu核数
 */
+ (NSUInteger)wxs_cpuNumber;

/**
 获取当前设备mac地址
 
 @return 当前设备mac地址
 */
+ (NSString *)wxs_macAddress;

/**
 获取当前设备总内存

 @return 当前设备总内存
 */
+ (NSUInteger)wxs_totalMemoryBytes;

/**
 获取当前设备内核内存

 @return 当前设备内核内存
 */
+ (NSUInteger)wxs_userMemoryBytes;

/**
 获取当前设备总闪存大小

 @return 当前设备总闪存大小
 */
+ (NSNumber *)wxs_totalDiskSpaceBytes;

/**
  获取当前设备空闲闪存大小

 @return 当前设备空闲闪存大小
 */
+ (NSNumber *)wxs_freeDiskSpaceBytes;

@end
