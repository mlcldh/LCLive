//
//  LCMediator.h
//  LCMediator
//
//  Created by menglingchao on 2020/10/14.
//

#import <Foundation/Foundation.h>
#import "LCUserModuleProtocol.h"
#import "LCShareModuleProtocol.h"
#import "LCWebModuleProtocol.h"
#import "LCChatModuleProtocol.h"
#import "LCMomentModuleProtocol.h"
#import "LCMeModuleProtocol.h"
#import "LCLaunchModuleProtocol.h"

/**给Swift代码使用的中间件*/
@interface LCMediator : NSObject

/**用户信息模块*/
+ (id <LCUserModule>)userModule;
/**分享模块*/
+ (id <LCShareModule>)shareModule;
/**H5相关模块*/
+ (id <LCWebModule>)webModule;
/**私信模块*/
+ (id <LCChatModule>)chatModule;
/**动态模块*/
+ (id <LCMomentModule>)momentModule;
/**我的相关页面模块*/
+ (id <LCMeModule>)meModule;
/**app启动后处理的模块*/
+ (id <LCLaunchModule>)launchModule;

@end

