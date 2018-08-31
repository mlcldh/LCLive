//
//  LCChatViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/10.
//

#import "LCUserChatViewController.h"
#import "LCMediatorHeader.h"
#import "LCUserModuleProtocol.h"
//#import <LCMediator/LCWebModuleProtocol.h>
#import "LCWebModuleProtocol.h"
#import "LCMomentModuleProtocol.h"

@interface LCUserChatViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;
@property (nonatomic,strong)UIButton *seeMomentButton;//显示动态
@property (nonatomic,strong)UIButton *seeH5Button;//显示h5
@property (nonatomic,strong)UIButton *cameraButton;//
@property (nonatomic,strong)UIButton *albumButton;//

@end

@implementation LCUserChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self nicknameLabel];
    [self seeMomentButton];
    [self seeH5Button];
    [self cameraButton];
    [self albumButton];
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
        _nicknameLabel.textColor = [UIColor whiteColor];
        id<LCUserModule> userModuleClass = LCModuleInstanceFromProtocol(@protocol(LCUserModule));
        [userModuleClass nickname];
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
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(50);
        }];
    }
    return _seeMomentButton;
}
- (UIButton *)seeH5Button {
    if (!_seeH5Button) {
        _seeH5Button = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _seeH5Button.backgroundColor = [UIColor purpleColor];
        [_seeH5Button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_seeH5Button setTitle:@"查看h5" forState:(UIControlStateNormal)];
        [_seeH5Button addTarget:self action:@selector(seeH5ButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_seeH5Button];
        [_seeH5Button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(150);
        }];
    }
    return _seeH5Button;
}
- (UIButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _cameraButton.backgroundColor = [UIColor purpleColor];
        [_cameraButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_cameraButton setImage:[UIImage imageNamed:@"lc_btn_chat_album"] forState:(UIControlStateNormal)];
        [_cameraButton addTarget:self action:@selector(seeH5ButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_cameraButton];
        [_cameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(200);
        }];
    }
    return _cameraButton;
}
- (UIButton *)albumButton {
    if (!_albumButton) {
        _albumButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _albumButton.backgroundColor = [UIColor purpleColor];
        [_albumButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_albumButton setImage:[UIImage imageNamed:@"lc_btn_chat_camera"] forState:(UIControlStateNormal)];
        [_albumButton addTarget:self action:@selector(seeH5ButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_albumButton];
        [_albumButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cameraButton.mas_right).offset(20);
            make.centerY.equalTo(self.cameraButton);
        }];
    }
    return _albumButton;
}
#pragma mark - Action
- (void)seeMomentButtonAction:(UIButton *)button {
    id<LCMomentModule> momentModuleClass = LCModuleInstanceFromProtocol(@protocol(LCMomentModule));
    [momentModuleClass pushMomentDetailViewControllerWithMomentId:@"110" fromViewController:self];
}
- (void)seeH5ButtonAction:(UIButton *)button {
    id<LCWebModule> webModuleClass = LCModuleInstanceFromProtocol(@protocol(LCWebModule));
    [webModuleClass pushWebViewControllerWithUrlString:@"https://github.com/mlcldh/" fromViewController:self];
}

@end
