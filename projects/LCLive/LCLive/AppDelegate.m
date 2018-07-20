//
//  AppDelegate.m
//  LCLive
//
//  Created by MengLingChao on 2018/7/6.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "AppDelegate.h"
#import "LCUserModule.h"
#import "LCWebModule.h"
#import "LCMomentModule.h"
#import "LCChatModule.h"
#import "LCMeModule.h"
//#import "LCNavigationController.h"
#import "LCSessionListViewController.h"
#import "LCMomentListViewController.h"
#import "LCMeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [LCUserModule class];
    [LCWebModule class];
    [LCChatModule class];
    [LCMomentModule class];
    [LCMeModule class];
    
    NSArray *titles = @[@"消息",@"朋友圈",@"我的"];
    NSArray *imageTags = @[@"message",@"moment",@"me"];
    NSArray *vcClasses = @[[LCSessionListViewController class],[LCMomentListViewController class],[LCMeViewController class]];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSInteger i = 0; i < titles.count; i ++) {
        UIViewController *vc = [vcClasses[i] new];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:titles[i] image:[UIImage imageNamed:[NSString stringWithFormat:@"lc_root_tab_%@_normal",imageTags[i]]] selectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"lc_root_tab_%@_pressed",imageTags[i]]]];
        vc.tabBarItem = tabBarItem;
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
//        LCNavigationController *nc = [[LCNavigationController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nc];
    }
    UITabBarController *tbc = [[UITabBarController alloc]init];
    tbc.viewControllers = viewControllers;
    self.window.rootViewController = tbc;
    
    [self.window makeKeyAndVisible];
    return YES;
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
