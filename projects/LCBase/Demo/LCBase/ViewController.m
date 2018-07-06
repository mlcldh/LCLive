//
//  ViewController.m
//  LCBase
//
//  Created by MengLingChao on 2018/7/6.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
//#import "ELModalWeexController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    NSLog(@"viewDidLoad %@",self);
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self button];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //    NSLog(@"viewDidAppear %@,%@",self,self.parentViewController);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    NSLog(@"viewWillDisappear %@,%@",self,self.parentViewController);
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //    NSLog(@"viewDidDisappear %@,%@",self,self.parentViewController);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button.backgroundColor = [UIColor purpleColor];
        [_button setTitle:@"push TwoVC" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20);
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }];
    }
    return _button;
}
#pragma mark - Event
- (void)buttonAction:(UIButton *)button {
    //    ELModalWeexController *mVC = [[ELModalWeexController alloc]init];
    //    [self presentViewController:mVC animated:YES completion:^{
    //    }];
    SecondViewController *twoVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

@end
