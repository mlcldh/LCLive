//
//  LCMeModule.m
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCMeModule.h"
#import "LCMeViewController.h"

@implementation LCMeModule

+ (UIViewController *)meViewController {
    LCMeViewController *vc = [[LCMeViewController alloc]init];
    return vc;
}

@end
