//
//  LCShareModule.m
//  Pods
//
//  Created by menglingchao on 2020/10/14.
//

#import "LCShareModule.h"

@implementation LCShareModule

- (void)shareWithTitle:(NSString *)title description:(NSString *)description iconImage:(UIImage *)iconImage toPlatform:(LCShareModulePlatform)platform {
    NSLog(@"menglc 分享 标题: %@, 描述: %@, 小图标: %@, 平台: %@", title, description, iconImage, @(platform));
}

@end
