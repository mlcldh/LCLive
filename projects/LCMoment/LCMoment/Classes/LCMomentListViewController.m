//
//  LCMomentListViewController.m
//  LCMoment
//
//  Created by MengLingChao on 2018/7/20.
//

#import "LCMomentListViewController.h"

@interface LCMomentListViewController ()

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LCMomentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"朋友圈";
    [self tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter


@end
