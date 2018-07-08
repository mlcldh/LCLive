//
//  ViewController.m
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "LCMediatorHeader.h"
#import "LCUserModuleProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
    NSString *userId = [userModuleClass userId];
    NSLog(@"%@",userId);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
