//
//  UIViewController+wxs_Util.m
//  dyk_cms
//
//  Created by Xushun Wu on 2017/4/24.
//  Copyright © 2017年 csh. All rights reserved.
//

#import "UIViewController+wxs_Util.h"

@implementation UIViewController (wxs_Util)

+ (UIViewController *)rootControllerWithKeyWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return window.rootViewController;
}

+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
