//
//  LCMomentDetailViewController.m
//  Pods
//
//  Created by MengLingChao on 2018/7/20.
//

#import "LCMomentDetailViewController.h"

@interface LCMomentDetailViewController ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *momentImageView;

@end

@implementation LCMomentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动态详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self titleLabel];
    [self momentImageView];
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
        _titleLabel.text = [NSString stringWithFormat:@"这是个id为%@的动态",self.momentId];
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
- (UIImageView *)momentImageView {
    if (!_momentImageView) {
        _momentImageView = [[UIImageView alloc]init];
        _momentImageView.backgroundColor = [UIColor purpleColor];
        _momentImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_momentImageView yy_setImageWithURL:[NSURL URLWithString:@"http://n1.itc.cn/img8/wb/recom/2016/06/09/146545942357102855.JPEG"] placeholder:nil];
        [self.view addSubview:_momentImageView];
        [_momentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30);
            make.width.equalTo(self.view).multipliedBy(0.5);
            make.height.equalTo(_momentImageView.mas_width).multipliedBy(9.f/16.f);
        }];
    }
    return _momentImageView;
}

@end
