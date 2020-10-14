//
//  LCMeViewController.m
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//

#import "LCMeViewController.h"
#import "LCUserModuleProtocol.h"
#import "LCShareModuleProtocol.h"
#import "MLCMacror.h"
#import "UIControl+MLCKit.h"
#import <objc/runtime.h>

@interface LCMeViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;
@property (nonatomic,strong)UILabel *userIdLabel;
@property (nonatomic,strong)UIImageView *avatarView;
@property (nonatomic,strong)UIButton *shareAppButton;

@end

@implementation LCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    LCMeModule *meModule = [[LCMeModule alloc]init];
//    NSArray *allBundles = [NSBundle allBundles];
//    for (NSBundle *bundle in allBundles) {
//        NSLog(@"bundle = %@",bundle);
//    }
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    [self nicknameLabel];
    [self userIdLabel];
    [self avatarView];
    [self shareAppButton];
    
    [self printUserInfo];
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
//        id<LCUserModule> userModuleClass = LCModuleInstanceFromProtocol(@protocol(LCUserModule));
        _nicknameLabel.text = [@"昵称: " stringByAppendingString:[LCGetModuleInstance(LCUserModule) nickname]];
        [self.view addSubview:_nicknameLabel];
        [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
            }
        }];
    }
    return _nicknameLabel;
}
- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc]init];
        _userIdLabel.backgroundColor = [UIColor purpleColor];
        _userIdLabel.textColor = [UIColor whiteColor];
        _userIdLabel.text = [@"userId: " stringByAppendingString:[LCGetModuleInstance(LCUserModule) userId]];
        [self.view addSubview:_userIdLabel];
        [_userIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-20);
            make.centerY.equalTo(self.nicknameLabel);
        }];
    }
    return _userIdLabel;
}
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc]init];
//        _avatarView.backgroundColor = [UIColor purpleColor];
//        _avatarView.contentMode = UIViewContentModeScaleAspectFill;
        [_avatarView yy_setImageWithURL:[NSURL URLWithString:[LCGetModuleInstance(LCUserModule) avatarUrlString]] placeholder:nil];
        [self.view addSubview:_avatarView];
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nicknameLabel);
            make.top.equalTo(self.nicknameLabel.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
    }
    return _avatarView;
}
- (UIButton *)shareAppButton {
    if (!_shareAppButton) {
        _shareAppButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _shareAppButton.backgroundColor = [UIColor purpleColor];
        [_shareAppButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_shareAppButton setTitle:@"分享app" forState:(UIControlStateNormal)];
//        @weakify(self)
        [_shareAppButton setMlc_touchUpInsideBlock:^{
//            @strongify(self)
            [LCGetModuleInstance(LCShareModule) shareWithTitle:@"直播app" description:@"app描述" iconImage:[UIImage imageNamed:@"lc_root_tab_me_pressed"] toPlatform:(LCShareModulePlatformWechatTimeLine)];
        }];
        [self.view addSubview:_shareAppButton];
        [_shareAppButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view).offset(-20);
            make.top.equalTo(self.avatarView.mas_bottom).offset(50);
        }];
    }
    return _shareAppButton;
}
#pragma mark -
- (void)printUserInfo {
    LCModuleInstance(userModule, LCUserModule)
    NSLog(@"menglc userId: %@, token: %@, nickname: %@, avatarUrlString: %@", userModule.userId, userModule.token, userModule.nickname, userModule.avatarUrlString);
}
- (void)test {
//    NSString *hehe = @"LCWhat";
//    const char *name = hehe.UTF8String;
//    Class oneClass = objc_getClass(name);
    
//    Class meVCClass =  NSClassFromString(@"LCMeViewController");
//    Class meModuleClass =  NSClassFromString(@"LCMeModule");
//    Class heheClass =  NSClassFromString(@"LCHehe");
//    Class aClass =  NSClassFromString(@"LCUserModule");
    NSString *userId = [LCGetModuleInstance(LCUserModule)  userId];
    NSLog(@"userId = %@",userId);
}

@end
