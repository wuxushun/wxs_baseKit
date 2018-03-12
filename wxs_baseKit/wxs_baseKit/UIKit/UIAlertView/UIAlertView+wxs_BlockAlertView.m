//
//  UIAlertView+wxs_BlockAlertView.m
//  dyk_cms
//
//  Created by Xushun Wu on 2017/4/28.
//  Copyright © 2017年 csh. All rights reserved.
//

#import "UIAlertView+wxs_BlockAlertView.h"

static ClickAtIndexBlock _ClickAtIndexBlock;

@interface UIAlertView ()<UIAlertViewDelegate>

@end

@implementation UIAlertView (wxs_BlockAlertView)

+ (void)alertTitle:(NSString *)title
       withContent:(NSString *)content
     withCancelBtn:(NSString *)cancelBtnName
      witnOtherBtn:(NSArray *)otherBtnName
  withClickedBlock:(ClickAtIndexBlock)block
{
    
    _ClickAtIndexBlock = [block copy];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title
                                                   message:content
                                                  delegate:self
                                         cancelButtonTitle:cancelBtnName
                                         otherButtonTitles: nil];
    
    for (id obj in otherBtnName) {
        if ([obj isKindOfClass:[NSString class]]) {
            [alert addButtonWithTitle:obj];
        }
    }
    
    [alert show];
    
}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (_ClickAtIndexBlock) {
        _ClickAtIndexBlock(buttonIndex);
    }
}

@end
