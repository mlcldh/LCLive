//
//  LCShareModuleProtocol.h
//  Pods
//
//  Created by menglingchao on 2020/10/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**分享平台*/
typedef NS_ENUM(NSInteger, LCShareModulePlatform) {
    LCShareModulePlatformWechatSession = 0,//微信好友
    LCShareModulePlatformWechatTimeLine = 1,//微信朋友圈
    LCShareModulePlatformQQFriend = 1,//QQ好友
    LCShareModulePlatformQQZone = 1,//QQ空间
    LCShareModulePlatformSinaWeibo = 1,//新浪微博
};

/**分享模块协议*/
@protocol LCShareModule <NSObject>

- (void)shareWithTitle:(NSString *)title description:(NSString *)description iconImage:(UIImage *)iconImage toPlatform:(LCShareModulePlatform)platform;

@end
