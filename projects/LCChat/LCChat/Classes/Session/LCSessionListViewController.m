//
//  LCSessionListViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/10.
//

#import "LCSessionListViewController.h"
#import "LCUserChatViewController.h"

@interface LCSessionListViewController ()

@property (nonatomic,strong)UIButton *button;

@end

@implementation LCSessionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self button];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _button.backgroundColor = [UIColor purpleColor];
        [_button setTitle:@"button" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }];
    }
    return _button;
}
#pragma mark - Action
- (void)buttonAction:(UIButton *)button {
    LCUserChatViewController *chatVC = [[LCUserChatViewController alloc]init];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
