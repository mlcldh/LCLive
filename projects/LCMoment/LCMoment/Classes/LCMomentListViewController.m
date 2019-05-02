//
//  LCMomentListViewController.m
//  LCMoment
//
//  Created by MengLingChao on 2018/7/20.
//

#import "LCMomentListViewController.h"
#import "LCMomentDetailViewController.h"

@interface LCMomentListViewController ()

//@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)UIButton *seeMomentButton;//显示动态

@end

@implementation LCMomentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动态";
    [self seeMomentButton];
//    [self tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIButton *)seeMomentButton {
    if (!_seeMomentButton) {
        _seeMomentButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _seeMomentButton.backgroundColor = [UIColor purpleColor];
        [_seeMomentButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_seeMomentButton setTitle:@"查看动态" forState:(UIControlStateNormal)];
        [_seeMomentButton addTarget:self action:@selector(seeMomentButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_seeMomentButton];
        [_seeMomentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(50);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom).offset(50);
            }
        }];
    }
    return _seeMomentButton;
}
#pragma mark - Action
- (void)seeMomentButtonAction:(UIButton *)button {
    LCMomentDetailViewController *momentDetailVC = [[LCMomentDetailViewController alloc]init];
    momentDetailVC.momentId = @"321123";
    momentDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:momentDetailVC animated:YES];
}

@end
