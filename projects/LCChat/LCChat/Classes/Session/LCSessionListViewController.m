//
//  LCSessionListViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/10.
//

#import "LCSessionListViewController.h"
#import "LCUserChatViewController.h"

@interface LCSessionListViewController ()

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) NSMapTable *table;

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
        [_button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_button setTitle:@"查看单聊详情" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom);
            }
        }];
    }
    return _button;
}
- (NSMapTable *)table {
    if (!_table) {
        _table = [NSMapTable weakToWeakObjectsMapTable];
    }
    return _table;
}
#pragma mark - Action
- (void)buttonAction:(UIButton *)button {
    LCUserChatViewController *chatVC = [[LCUserChatViewController alloc]init];
//    UIViewController *vc = [self.table objectForKey:@"chatVC"];
    [self.table setObject:chatVC forKey:@"chatVC"];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
