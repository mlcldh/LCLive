//
//  LCLaunchModule.h
//  Pods
//
//  Created by MengLingChao on 2018/9/26.
//

#import <Foundation/Foundation.h>

/**app启动后处理的模块协议*/
@protocol LCLaunchModule <NSObject>

/**处理启动*/
- (void)handleDidFinishLaunchingApplication:(UIApplication *)application options:(NSDictionary *)launchOptions window:(UIWindow *)window;

@end
