//
//  LCWebModule.m
//  LCWeb
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCWebModule.h"
#import "LCWebViewController.h"

@implementation LCWebModule

+ (void)pushWebViewControllerWithUrlString:(NSString *)urlString fromViewController:(UIViewController *)viewController {
    LCWebViewController *webVC = [[LCWebViewController alloc]init];
    webVC.urlString = urlString;
    [viewController.navigationController pushViewController:webVC animated:YES];
}

@end
