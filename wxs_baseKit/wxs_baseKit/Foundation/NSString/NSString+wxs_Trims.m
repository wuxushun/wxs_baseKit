//
//  NSString+wxs_Trims.m
//  wxs_baseKit
//
//  Created by Xushun Wu on 2017/4/18.
//  Copyright © 2017年 Xushun Wu. All rights reserved.
//

#import "NSString+wxs_Trims.h"

@implementation NSString (wxs_Trims)


- (NSString *)wxs_stringByStrippingHTML {
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

- (NSString *)wxs_stringByRemovingScriptsAndStrippingHTML {
    NSMutableString *mString = [self mutableCopy];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult *match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString wxs_stringByStrippingHTML];
}

- (NSString *)wxs_trimmingRoundWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)wxs_trimmingWhitespace
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)wxs_trimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
