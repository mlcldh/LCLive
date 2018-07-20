//
//  LCChatViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/10.
//

#import "LCChatViewController.h"
#import "LCMediatorHeader.h"
#import "LCUserModuleProtocol.h"
#import "Masonry.h"

@interface LCChatViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;

@end

@implementation LCChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self nicknameLabel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UILabel *)nicknameLabel {
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc]init];
        _nicknameLabel.backgroundColor = [UIColor purpleColor];
        Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
        _nicknameLabel.text = [userModuleClass nickname];
        [self.view addSubview:_nicknameLabel];
        [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo(self.view);
            }
        }];
    }
    return _nicknameLabel;
}

@end
