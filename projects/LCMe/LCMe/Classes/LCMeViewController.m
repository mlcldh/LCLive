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
#import <objc/runtime.h>

//@class LCMeModule;

@interface LCMeViewController ()

@end

@implementation LCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    LCMeModule *meModule = [[LCMeModule alloc]init];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
