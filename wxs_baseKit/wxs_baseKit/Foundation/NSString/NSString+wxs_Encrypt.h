//
//  NSString+wxs__Encrypt.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Encrypt)

#pragma mark -- AES

/**
 AES加密数据
 
 @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 @param iv  iv
 
 @return data
 */
- (NSString *)wxs_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 AES解密数据
 
 @param key key 长度一般为16
 @param iv  iv
 
 @return data
 */
- (NSString *)wxs_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark -- DES

/**
 *  DES加密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString *)wxs_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 DES解密数据
 
 @param key key 长度一般为8
 @param iv  iv
 
 @return data
 */
- (NSString*)wxs_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 3DES加密数据
 
 @param key key 长度一般为24
 @param iv  iv
 
 @return data
 */
- (NSString*)wxs_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 3DES解密数据
 
 @param key key 长度一般为24
 @param iv  iv
 
 @return data
 */
- (NSString*)wxs_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark -- SHA
/// 返回结果：40长度   终端命令：echo -n "123" | openssl sha -sha1
@property (readonly) NSString *wxs_sha1String;
/// 返回结果：56长度   终端命令：echo -n "123" | openssl sha -sha224
@property (readonly) NSString *wxs_sha224String;
/// 返回结果：64长度   终端命令：echo -n "123" | openssl sha -sha256
@property (readonly) NSString *wxs_sha256String;
/// 返回结果：96长度   终端命令：echo -n "123" | openssl sha -sha384
@property (readonly) NSString *wxs_sha384String;
/// 返回结果：128长度   终端命令：echo -n "123" | openssl sha -sha512
@property (readonly) NSString *wxs_sha512String;

/// 返回结果：40长度   echo -n "123" | openssl sha -sha1 -hmac "123"
- (NSString *)wxs_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)wxs_hmacSHA224StringWithKey:(NSString *)key;
- (NSString *)wxs_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)wxs_hmacSHA384StringWithKey:(NSString *)key;
- (NSString *)wxs_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark --MD5

/// 返回结果：32长度(128位，16字节，16进制字符输出则为32字节长度)   终端命令：md5 -s "123"
@property (readonly) NSString *wxs_md5String;

/// 返回结果：32长度  终端命令：echo -n "123" | openssl dgst -md5 -hmac "123"
- (NSString *)wxs_hmacMD5StringWithKey:(NSString *)key;

@end
