//
//  LCMeModule.h
//  LCMe
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**我的相关页面模块协议*/
@protocol LCMeModule <NSObject>

/**获取我的页面视图控制器*/
- (UIViewController *)meViewController;

@end
