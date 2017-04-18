//
//  NSString+wxs_Pinyin.h
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (wxs_Pinyin)

- (NSString *)wxs_pinyinWithPhoneticSymbol;
- (NSString *)wxs_pinyin;
- (NSArray *)wxs_pinyinArray;
- (NSString *)wxs_pinyinWithoutBlank;
- (NSArray *)wxs_pinyinInitialsArray;
- (NSString *)wxs_pinyinInitialsString;

@end
