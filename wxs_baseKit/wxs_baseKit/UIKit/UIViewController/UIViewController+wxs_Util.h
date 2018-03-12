//
//  UIViewController+wxs_Util.h
//  dyk_cms
//
//  Created by Xushun Wu on 2017/4/24.
//  Copyright © 2017年 csh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (wxs_Util)

+ (UIViewController *)rootControllerWithKeyWindow;

+ (UIViewController *)topViewController;

@end
