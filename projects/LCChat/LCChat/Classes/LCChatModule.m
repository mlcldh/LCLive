//
//  LCChatModule.m
//  LCChat
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCChatModule.h"
#import "LCSessionListViewController.h"
#import "LCUserChatViewController.h"

@implementation LCChatModule

- (UIViewController *)sessionListViewController {
    LCSessionListViewController *vc = [[LCSessionListViewController alloc]init];
    return vc;
}
- (NSUInteger)ureandCount {
    return 3;
}
- (void)pushUserChatViewControllerWithUserId:(NSString *)userId fromViewController:(UIViewController *)viewController {
    LCUserChatViewController *userChatVC = [[LCUserChatViewController alloc]init];
    [viewController.navigationController pushViewController:userChatVC animated:YES];
}

@end
