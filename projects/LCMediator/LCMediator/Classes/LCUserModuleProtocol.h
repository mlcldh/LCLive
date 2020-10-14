//
//  LCUserModule.h
//  LCUser
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**用户信息模块协议*/
@protocol LCUserModule <NSObject>

/**用户id*/
- (NSString *)userId;
/**token*/
- (NSString *)token;
/**用户昵称*/
- (NSString *)nickname;
/**用户头像url地址*/
- (NSString *)avatarUrlString;

@end
