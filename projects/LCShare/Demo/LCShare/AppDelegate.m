//
//  AppDelegate.m
//  LCShare
//
//  Created by MengLingChao on 2018/8/10.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "AppDelegate.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "LCWechatShare.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([sourceApplication isEqualToString:@"com.tencent.mipadqq"] || [sourceApplication isEqualToString:@"com.tencent.mqq"]) {// QQ
        return [TencentOAuth HandleOpenURL:url];
    }
    else if ([sourceApplication isEqualToString:@"com.tencent.xin"]){// 微信
        return  [WXApi handleOpenURL:url delegate:[LCWechatShare sharedInstance]];
    }
//    else if ([sourceApplication isEqualToString:@"com.sina.weibohd"] || [sourceApplication isEqualToString:@"com.sina.weibo"]){// 新浪微博
//        return [WeiboSDK handleOpenURL:url delegate:[SinaWeibo new]];
//    }
    return YES;
}
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//
//}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [TencentOAuth HandleOpenURL:url];
    //    return [WeiboSDK handleOpenURL:url delegate:[SinaWeibo new] ];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
