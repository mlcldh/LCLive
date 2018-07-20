//
//  LCMeViewController.m
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//

#import "LCMeViewController.h"
#import "LCMediatorHeader.h"
#import "LCUserModuleProtocol.h"
//#import "LCMeModule.h"
#import "Masonry.h"
#import "UIImageView+YYWebImage.h"
#import <objc/runtime.h>

//@class LCMeModule;

@interface LCMeViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;
@property (nonatomic,strong)UIImageView *avatarView;
@property (nonatomic,strong)UILabel *userIdLabel;

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
    
    [self nicknameLabel];
    [self avatarView];
    [self userIdLabel];
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
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom);
            }
        }];
    }
    return _nicknameLabel;
}
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc]init];
        _avatarView.backgroundColor = [UIColor purpleColor];
//        Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
//        [_avatarView yy_setImageWithURL:[NSURL URLWithString:[userModuleClass avatarUrlString]] placeholder:nil];
        [self.view addSubview:_avatarView];
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            } else {
                make.left.equalTo(self.view);
            }
            make.centerY.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
    }
    return _avatarView;
}
- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc]init];
        _userIdLabel.backgroundColor = [UIColor purpleColor];
        Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
        _userIdLabel.text = [userModuleClass userId];
        [self.view addSubview:_userIdLabel];
        [_userIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
            }
        }];
    }
    return _userIdLabel;
}
#pragma mark -
- (void)test {
    NSString *hehe = @"LCWhat";
    const char *name = hehe.UTF8String;
    Class oneClass = objc_getClass(name);
    
    Class meVCClass =  NSClassFromString(@"LCMeViewController");
    Class meModuleClass =  NSClassFromString(@"LCMeModule");
    Class heheClass =  NSClassFromString(@"LCHehe");
    Class aClass =  NSClassFromString(@"LCUserModule");
    Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
    NSString *userId = [userModuleClass userId];
    NSLog(@"userId = %@",userId);
}

@end
