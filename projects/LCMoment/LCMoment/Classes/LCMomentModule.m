//
//  LCMomentModule.m
//  LCWeb
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCMomentModule.h"
#import "LCMomentDetailViewController.h"

@implementation LCMomentModule

+ (void)pushMomentDetailViewControllerWithMomentId:(NSString *)momentId fromViewController:(UIViewController *)viewController {
    LCMomentDetailViewController *momentDetailVC = [[LCMomentDetailViewController alloc]init];
    momentDetailVC.momentId = momentId;
    momentDetailVC.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:momentDetailVC animated:YES];
}

@end
