//
//  TwoViewController.m
//  MengNavigation
//
//  Created by menglingchao on 2018/1/5.
//  Copyright © 2018年 Google Inc. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "LCNavigationBar.h"
#import "Masonry.h"

@interface SecondViewController ()

@property (nonatomic,strong) LCNavigationBar *navigationBar;
@property(nonatomic,strong) UINavigationItem *navigationItem;
@property (nonatomic,strong) UIButton *button;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSLog(@"viewDidLoad %@",self);
    self.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(panVCAction:)];
    self.lc_navBarHidden = YES;
    [self navigationBar];
    [self button];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"viewWillAppear %@,%@",self,self.parentViewController);
//    //避免childViewController影响导航条的显示效果，当前控制器只有在navigationController控制器栈里面才生效
//    if ([self.navigationController.viewControllers indexOfObject:self] != NSNotFound) {
//        [self.navigationController setNavigationBarHidden:YES animated:YES];//self.el_navBarHidden
//    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"viewDidAppear %@,%@",self,self.parentViewController);
//    [self setNeedsStatusBarAppearanceUpdate];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"viewWillDisappear %@,%@",self,self.parentViewController);
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    NSLog(@"viewDidDisappear %@,%@",self,self.parentViewController);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}
#pragma mark - Getter
- (LCNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[LCNavigationBar alloc]init];
        _navigationBar.navigationItem.leftBarButtonItems = @[self.backItem];
        [self.view addSubview:_navigationBar];
        [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.left.right.equalTo(self.view);
            make.height.equalTo(self.navigationBar);
//            make.height.mas_equalTo(44);
        }];
    }
    return _navigationBar;
}
//- (UINavigationItem *)navigationItem {
//    if (!_navigationItem) {
//        _navigationItem = ;
//    }
//    return _navigationItem;
//}
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button.backgroundColor = [UIColor blueColor];
        [_button setTitle:@"push thirdVC" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.view).offset(100);
//            make.top.equalTo(self.mas_topLayoutGuideBottom);
//            make.top.equalTo(self.navigationBar.mas_bottom);
        }];
    }
    return _button;
}
#pragma mark - Event
- (void)panVCAction:(UIGestureRecognizer *)recognizer {
    
}
- (void)buttonAction:(UIButton *)button {
    //    ELModalWeexController *mVC = [[ELModalWeexController alloc]init];
    //    [self presentViewController:mVC animated:YES completion:^{
    //    }];
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

@end
