//
//  LCMediator.m
//  LCMediator
//
//  Created by menglingchao on 2020/10/14.
//

#import "LCMediator.h"
#import "LCMediatorHeader.h"

@implementation LCMediator

+ (id <LCUserModule>)userModule {
    return LCGetModuleInstance(LCUserModule);
}
+ (id <LCShareModule>)shareModule {
    return LCGetModuleInstance(LCShareModule);
}
+ (id <LCWebModule>)webModule {
    return LCGetModuleInstance(LCWebModule);
}
+ (id <LCChatModule>)chatModule {
    return LCGetModuleInstance(LCChatModule);
}
+ (id <LCMomentModule>)momentModule {
    return LCGetModuleInstance(LCMomentModule);
}
+ (id <LCMeModule>)meModule {
    return LCGetModuleInstance(LCMeModule);
}
+ (id <LCLaunchModule>)launchModule {
    return LCGetModuleInstance(LCLaunchModule);
}

@end
