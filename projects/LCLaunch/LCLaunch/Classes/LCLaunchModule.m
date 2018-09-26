//
//  LCLaunchModule.m
//  Pods
//
//  Created by MengLingChao on 2018/9/26.
//

#import "LCLaunchModule.h"
#import "LCChatModuleProtocol.h"
#import "LCMomentModuleProtocol.h"
#import "LCMeModuleProtocol.h"
//#import "LCNavigationController.h"

@implementation LCLaunchModule

- (void)handleDidFinishLaunchingApplication:(UIApplication *)application options:(NSDictionary *)launchOptions window:(UIWindow *)window{
    window.backgroundColor = [UIColor whiteColor];
    
    //    [LCUserModule class];
    //    [LCWebModule class];
    //    [LCChatModule class];
    //    [LCMomentModule class];
    //    [LCMeModule class];
    
    NSArray *titles = @[@"消息",@"朋友圈",@"我的"];
    NSArray *imageTags = @[@"message",@"moment",@"me"];
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSInteger i = 0; i < titles.count; i ++) {
        UIViewController *vc = nil;
        switch (i) {
            case 0:{
                LCModuleInstance(module, LCChatModule)
                vc = [module sessionListViewController];
            }
                break;
            case 1:{
                LCModuleInstance(module, LCMomentModule)
                vc = [module momentListViewController];
            }
                break;
            case 2:{
                LCModuleInstance(module, LCMeModule)
                vc = [module meViewController];
            }
                break;
            default:
                break;
        }
        //        NSLog(@"vc = %@",vc);
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:titles[i] image:[UIImage imageNamed:[NSString stringWithFormat:@"lc_root_tab_%@_normal",imageTags[i]]] selectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"lc_root_tab_%@_pressed",imageTags[i]]]];
        vc.tabBarItem = tabBarItem;
        UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
        //        LCNavigationController *nc = [[LCNavigationController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nc];
    }
    UITabBarController *tbc = [[UITabBarController alloc]init];
    tbc.viewControllers = viewControllers;
    window.rootViewController = tbc;
    
    [window makeKeyAndVisible];
}

@end
