//
//  NSData+wxs_Encrypt.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (wxs_Encrypt)

/**
 利用AES加密数据
 
 @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 @param iv  iv description
 
 @return data
 */
- (NSData *)wxs_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 利用AES解密据
 
 @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 @param iv  iv
 
 @return 解密后数据
 */
- (NSData *)wxs_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 利用DES加密数据
 
 @param key key 长度一般为8
 @param iv  iv description
 
 @return data
 */
- (NSData *)wxs_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 利用DES解密数据
 
 @param key key 长度一般为8
 @param iv  iv
 
 @return 解密后数据
 */
- (NSData *)wxs_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 利用3DES加密数据
 
 @param key key 长度一般为24
 @param iv  iv description
 
 *  @return data
 */

- (NSData *)wxs_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 利用3DES解密数据
 
 @param key key 长度一般为24
 @param iv  iv
 
 @return 解密后数据
 */
- (NSData *)wxs_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


- (NSData *)wxs_CCCryptData:(NSData *)data
                 algorithm:(CCAlgorithm)algorithm
                 operation:(CCOperation)operation
                       key:(NSString *)key
                        iv:(NSData *)iv;

#pragma mark --SHA

/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *wxs_sha1Data;
/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *wxs_sha256Data;
/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *wxs_sha512Data;

/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)wxs_hmacSHA1DataWithKey:(NSData *)key;
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)wxs_hmacSHA256DataWithKey:(NSData *)key;
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)wxs_hmacSHA512DataWithKey:(NSData *)key;


/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *wxs_md5Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)wxs_hmacMD5DataWithKey:(NSData *)key;

@end
