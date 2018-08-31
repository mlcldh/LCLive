//
//  LCWebModule.h
//  LCMediator
//
//  Created by MengLingChao on 2018/7/6.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**web模块协议*/
@protocol LCWebModule <NSObject>

/**跳转到h5详情*/
- (void)pushWebViewControllerWithUrlString:(NSString *)urlString fromViewController:(UIViewController *)viewController;

@end
