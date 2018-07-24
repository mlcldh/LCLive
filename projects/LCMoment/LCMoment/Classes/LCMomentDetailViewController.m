//
//  LCMomentDetailViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/20.
//

#import "LCMomentDetailViewController.h"

@interface LCMomentDetailViewController ()

@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation LCMomentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动态详情";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [UIColor purpleColor];
//        Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
//        _nicknameLabel.text = [userModuleClass nickname];
        [self.view addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom);
            }
        }];
    }
    return _titleLabel;
}

@end
