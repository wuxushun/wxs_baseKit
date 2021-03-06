//
//  NSString+wxs__Encrypt.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSString+wxs_Encrypt.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+wxs_Encrypt.h"
#import "NSData+wxs_Base64.h"

@implementation NSString (wxs_Encrypt)

-(NSString*)wxs_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] wxs_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted wxs_base64EncodedString];
    
    return encryptedString;
}

- (NSString *)wxs_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData wxs_dataWithBase64EncodedString:self] wxs_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString *)wxs_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] wxs_encryptedWithDESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted wxs_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)wxs_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData wxs_dataWithBase64EncodedString:self] wxs_decryptedWithDESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString *)wxs_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] wxs_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted wxs_base64EncodedString];
    
    return encryptedString;
}

- (NSString *)wxs_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv
{
    NSData *decrypted = [[NSData wxs_dataWithBase64EncodedString:self] wxs_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}


- (NSString *)wxs_md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
- (NSString *)wxs_sha1String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
- (NSString *)wxs_sha224String {
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA224(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
- (NSString *)wxs_sha256String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
- (NSString *)wxs_sha384String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA384(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
- (NSString *)wxs_sha512String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(string, length, bytes);
    return [self wxs_stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)wxs_hmacMD5StringWithKey:(NSString *)key
{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgMD5 withKey:key];
}
- (NSString *)wxs_hmacSHA1StringWithKey:(NSString *)key
{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgSHA1 withKey:key];
    
}
- (NSString *)wxs_hmacSHA224StringWithKey:(NSString *)key{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgSHA224 withKey:key];
}
- (NSString *)wxs_hmacSHA256StringWithKey:(NSString *)key
{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgSHA256 withKey:key];
    
}
- (NSString *)wxs_hmacSHA384StringWithKey:(NSString *)key{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgSHA384 withKey:key];
}
- (NSString *)wxs_hmacSHA512StringWithKey:(NSString *)key
{
    return [self wxs_hmacStringUsingAlg:kCCHmacAlgSHA512 withKey:key];
    
}
#pragma mark - Helpers
- (NSString *)wxs_hmacStringUsingAlg:(CCHmacAlgorithm)alg withKey:(NSString *)key {
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
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:size];
    CCHmac(alg, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self wxs_stringFromBytes:(unsigned char *)mutableData.bytes length:(int)mutableData.length];
}
- (NSString *)wxs_stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

@end
