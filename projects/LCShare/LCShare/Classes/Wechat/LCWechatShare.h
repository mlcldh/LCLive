//
//  LCWechatShare.h
//  Pods
//
//  Created by MengLingChao on 2018/8/13.
//

#import <Foundation/Foundation.h>
#import "LCShareProtocol.h"
#import "WXApi.h"

#define LCWechatAppKey @"wx2f82ffe909eafad2"

@interface LCWechatShare : NSObject<LCShareProtocol,WXApiDelegate>

/***/
@property (nonatomic,weak) UIViewController *viewController;
/***/
+ (instancetype)sharedInstance;

@end
