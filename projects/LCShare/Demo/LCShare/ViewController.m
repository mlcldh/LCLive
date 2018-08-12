//
//  ViewController.m
//  LCShare
//
//  Created by MengLingChao on 2018/8/10.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [WXApi registerApp:@"wx2f82ffe909eafad2"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
