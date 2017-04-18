//
//  NSData+wxs_Gzip.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (wxs_Gzip)

/**
 GZIP压缩
 
 @param level 压缩级别
 
 @return 压缩后的数据
 */
- (NSData *)wxs_gzippedDataWithCompressionLevel:(float)level;

/**
 GZIP压缩 压缩级别 默认-1
 
 压缩后的数据
 */
- (NSData *)wxs_gzippedData;

/**
 GZIP解压
 
 @return 解压后数据
 */
- (NSData *)wxs_gunzippedData;


/**
 是压缩过后的数据

 @return YES即为是
 */
- (BOOL)wxs_isGzippedData;

@end
