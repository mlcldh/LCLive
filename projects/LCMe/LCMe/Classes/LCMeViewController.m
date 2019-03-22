//
//  LCMeViewController.m
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//

#import "LCMeViewController.h"
#import "LCUserModuleProtocol.h"
#import <objc/runtime.h>

@interface LCMeViewController ()

@property (nonatomic,strong)UILabel *nicknameLabel;
@property (nonatomic,strong)NSMutableArray <UILabel *>*numberLabels;
@property (nonatomic,strong)NSMutableArray <UILabel *>*numberLabels2;
@property (nonatomic,strong)UILabel *oneLabel;//显示1/4
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self nicknameLabel];
    [self numberLabels];
    [self numberLabels2];
    [self oneLabel];
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
        _nicknameLabel.textColor = [UIColor whiteColor];
//        id<LCUserModule> userModuleClass = LCModuleInstanceFromProtocol(@protocol(LCUserModule));
        _nicknameLabel.text = [LCGetModuleInstance(LCUserModule) nickname];
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
- (NSMutableArray<UILabel *> *)numberLabels {
    if (!_numberLabels) {
        _numberLabels = [NSMutableArray array];
        NSArray *titles = @[@"One",@"Two",@"Three",@"Four"];
        for (NSInteger i = 0; i < titles.count; i ++) {
            UILabel *label = [[UILabel alloc]init];
            label.backgroundColor = [UIColor orangeColor];
            label.text = titles[i];
            label.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.nicknameLabel.mas_bottom).offset(20);
            }];
            [_numberLabels addObject:label];
        }
        [_numberLabels mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedItemLength:50 leadSpacing:20 tailSpacing:30];
    }
    return _numberLabels;
}
- (NSMutableArray<UILabel *> *)numberLabels2 {
    if (!_numberLabels2) {
        _numberLabels2 = [NSMutableArray array];
        NSArray *titles = @[@"One",@"Two",@"Three",@"Four"];
        for (NSInteger i = 0; i < titles.count; i ++) {
            UILabel *label = [[UILabel alloc]init];
            label.backgroundColor = [UIColor orangeColor];
            label.text = titles[i];
            label.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.nicknameLabel.mas_bottom).offset(50);
            }];
            [_numberLabels2 addObject:label];
        }
        [_numberLabels2 mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:50 leadSpacing:0 tailSpacing:0];
    }
    return _numberLabels2;
}
- (UILabel *)oneLabel {
    if (!_oneLabel) {
        _oneLabel = [[UILabel alloc]init];
        _oneLabel.backgroundColor = [UIColor purpleColor];
        _oneLabel.textColor = [UIColor whiteColor];
        _oneLabel.text = @"1/4";
        _oneLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneLabelAction:)];
        [_oneLabel addGestureRecognizer:tap];
        [self.view addSubview:_oneLabel];
        [_oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_right).multipliedBy(1/4.f);
            make.top.equalTo(self.nicknameLabel.mas_bottom).offset(80);
        }];
    }
    return _oneLabel;
}
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc]init];
//        _avatarView.backgroundColor = [UIColor purpleColor];
        _avatarView.contentMode = UIViewContentModeScaleAspectFill;
        [_avatarView yy_setImageWithURL:[NSURL URLWithString:[LCGetModuleInstance(LCUserModule) avatarUrlString]] placeholder:nil];
        [self.view addSubview:_avatarView];
        [_avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (@available(iOS 11.0, *)) {
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            } else {
                make.left.equalTo(self.view);
            }
            make.centerY.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
    }
    return _avatarView;
}
- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc]init];
        _userIdLabel.backgroundColor = [UIColor purpleColor];
        _userIdLabel.textColor = [UIColor whiteColor];
        _userIdLabel.text = [LCGetModuleInstance(LCUserModule)  userId];
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
#pragma mark - Action
- (void)oneLabelAction:(UITapGestureRecognizer *)recognizer {
    NSInteger value = arc4random() % 300;
    [self.oneLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nicknameLabel.mas_bottom).offset(80 + value);
    }];
    [UIView animateWithDuration:3 animations:^{
        
        [self.oneLabel.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark -
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
