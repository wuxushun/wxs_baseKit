//
//  NSData+wxs_Encrypt.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSData+wxs_Encrypt.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (wxs_Encrypt)

static void wxs_FixKeyLengths(CCAlgorithm algorithm, NSMutableData * keyData, NSMutableData * ivData)
{
    NSUInteger keyLength = [keyData length];
    switch ( algorithm )
    {
        case kCCAlgorithmAES128:
        {
            if (keyLength <= 16)
            {
                [keyData setLength:16];
            }
            else if (keyLength>16 && keyLength <= 24)
            {
                [keyData setLength:24];
            }
            else
            {
                [keyData setLength:32];
            }
            
            break;
        }
            
        case kCCAlgorithmDES:
        {
            [keyData setLength:8];
            break;
        }
            
        case kCCAlgorithm3DES:
        {
            [keyData setLength:24];
            break;
        }
            
        case kCCAlgorithmCAST:
        {
            if (keyLength <5)
            {
                [keyData setLength:5];
            }
            else if ( keyLength > 16)
            {
                [keyData setLength:16];
            }
            
            break;
        }
            
        case kCCAlgorithmRC4:
        {
            if ( keyLength > 512)
                [keyData setLength:512];
            break;
        }
            
        default:
            break;
    }
    
    [ivData setLength:[keyData length]];
}

- (NSData *)wxs_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithmAES128 operation:kCCEncrypt key:key iv:iv];
}

- (NSData*)wxs_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithmAES128 operation:kCCDecrypt key:key iv:iv];
}

- (NSData *)wxs_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithm3DES operation:kCCEncrypt key:key iv:iv];
}

- (NSData *)wxs_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithm3DES operation:kCCDecrypt key:key iv:iv];
}

- (NSData *)wxs_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv{
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithmDES operation:kCCEncrypt key:key iv:iv];
}

- (NSData *)wxs_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv{
    return [self wxs_CCCryptData:self algorithm:kCCAlgorithmDES operation:kCCDecrypt key:key iv:iv];
}

- (NSData *)wxs_CCCryptData:(NSData *)data
                 algorithm:(CCAlgorithm)algorithm
                 operation:(CCOperation)operation
                       key:(NSString *)key
                        iv:(NSData *)iv {
    NSMutableData *keyData = [[key dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    NSMutableData *ivData = [iv mutableCopy];
    
    size_t dataMoved;
    
    int size = 0;
    if (algorithm == kCCAlgorithmAES128 ||algorithm == kCCAlgorithmAES) {
        size = kCCBlockSizeAES128;
    }else if (algorithm == kCCAlgorithmDES) {
        size = kCCBlockSizeDES;
    }else if (algorithm == kCCAlgorithm3DES) {
        size = kCCBlockSize3DES;
    }if (algorithm == kCCAlgorithmCAST) {
        size = kCCBlockSizeCAST;
    }
    
    NSMutableData *decryptedData = [NSMutableData dataWithLength:data.length + size];
    
    int option = kCCOptionPKCS7Padding | kCCOptionECBMode;
    if (iv) {
        option = kCCOptionPKCS7Padding;
    }
    wxs_FixKeyLengths(algorithm, keyData,ivData);
    CCCryptorStatus result = CCCrypt(operation,                    // kCCEncrypt or kCCDecrypt
                                     algorithm,
                                     option,                        // Padding option for CBC Mode
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     data.bytes,
                                     data.length,
                                     decryptedData.mutableBytes,    // encrypted data out
                                     decryptedData.length,
                                     &dataMoved);                   // total data moved
    
    if (result == kCCSuccess) {
        decryptedData.length = dataMoved;
        return decryptedData;
    }
    return nil;
}


/**
 *  @brief  md5 NSData
 */
- (NSData *)jk_md5Data
{
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
/**
 *  @brief  sha1Data NSData
 */
- (NSData *)jk_sha1Data
{
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
/**
 *  @brief  sha256Data NSData
 */
- (NSData *)jk_sha256Data
{
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
/**
 *  @brief  sha512Data NSData
 */
- (NSData *)jk_sha512Data
{
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}
/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)jk_hmacMD5DataWithKey:(NSData *)key {
    return [self jk_hmacDataUsingAlg:kCCHmacAlgMD5 withKey:key];
}
/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)jk_hmacSHA1DataWithKey:(NSData *)key
{
    return [self jk_hmacDataUsingAlg:kCCHmacAlgSHA1 withKey:key];
}
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)jk_hmacSHA256DataWithKey:(NSData *)key
{
    return [self jk_hmacDataUsingAlg:kCCHmacAlgSHA256 withKey:key];
}
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)jk_hmacSHA512DataWithKey:(NSData *)key
{
    return [self jk_hmacDataUsingAlg:kCCHmacAlgSHA512 withKey:key];
}


- (NSData *)jk_hmacDataUsingAlg:(CCHmacAlgorithm)alg withKey:(NSData *)key {
    
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    CCHmac(alg, [key bytes], key.length, self.bytes, self.length, result);
    return [NSData dataWithBytes:result length:size];
}

@end
