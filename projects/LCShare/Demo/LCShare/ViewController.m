//
//  ViewController.m
//  LCShare
//
//  Created by MengLingChao on 2018/8/10.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "WXApi.h"
#import "LCQQShare.h"
#import "LCWechatShare.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *qqLoginButton;
@property (nonatomic,strong) UIButton *wechatLoginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self qqLoginButton];
    [self wechatLoginButton];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIButton *)qqLoginButton {
    if (!_qqLoginButton) {
        _qqLoginButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _qqLoginButton.backgroundColor = [UIColor purpleColor];
        [_qqLoginButton setTitle:@"qq" forState:(UIControlStateNormal)];
        [_qqLoginButton addTarget:self action:@selector(qqLoginButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_qqLoginButton];
        [_qqLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
        }];
    }
    return _qqLoginButton;
}
- (UIButton *)wechatLoginButton {
    if (!_wechatLoginButton) {
        _wechatLoginButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _wechatLoginButton.backgroundColor = [UIColor purpleColor];
        [_wechatLoginButton setTitle:@"wechat" forState:(UIControlStateNormal)];
        [_wechatLoginButton addTarget:self action:@selector(wechatLoginButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_wechatLoginButton];
        [_wechatLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(60);
        }];
    }
    return _wechatLoginButton;
}
#pragma mark - Action
- (void)qqLoginButtonAction:(UIButton *)button {
    [LCQQShare login];
}
- (void)wechatLoginButtonAction:(UIButton *)button {
    [LCWechatShare login];
}

@end
