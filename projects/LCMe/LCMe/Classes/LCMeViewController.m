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
#import <objc/runtime.h>

//@class LCMeModule;

@interface LCMeViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;
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
    
//    [self nicknameLabel];
    [self userIdLabel];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UILabel *)nicknameLabel {
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc]init];
        Class userModuleClass = LCModuleClassFromProtocol(@protocol(LCUserModule));
//        _nicknameLabel.text = userModuleClass nick;
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

@end
