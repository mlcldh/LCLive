//
//  LCBaseViewController.m
//  LCBase
//
//  Created by MengLingChao on 2018/7/6.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCBaseViewController ()

@end

@implementation LCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //避免childViewController影响导航条的显示效果，当前控制器只有在navigationController控制器栈里面才生效
    if ([self.navigationController.viewControllers indexOfObject:self] != NSNotFound) {
        [self.navigationController setNavigationBarHidden:self.lc_navBarHidden animated:YES];
    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    BOOL enabled = self.navigationController.interactivePopGestureRecognizer.enabled;
//    NSLog(@"%@,enabled = %@",self,@(enabled));
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIBarButtonItem *)backItem {
    if (!_backItem) {
//        _backItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:(UIBarButtonItemStylePlain) target:self action:@selector(popAction:)];
        _backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"lcbase_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popAction:)];
//        _backItem.tintColor = [UIColor whiteColor];//返回按钮
    }
    return _backItem;
}
#pragma mark - Action
- (void)popAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
