//
//  UIAlertView+wxs_BlockAlertView.h
//  dyk_cms
//
//  Created by Xushun Wu on 2017/4/28.
//  Copyright © 2017年 csh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickAtIndexBlock)(NSInteger buttonIndex);

@interface UIAlertView (wxs_BlockAlertView)

+ (void)alertTitle:(NSString *)title
       withContent:(NSString *)content
     withCancelBtn:(NSString *)cancelBtnName
      witnOtherBtn:(NSArray *)otherBtnName
  withClickedBlock:(ClickAtIndexBlock)block;

@end
