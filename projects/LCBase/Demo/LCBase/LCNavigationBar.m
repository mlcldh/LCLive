//
//  ELNavigationBar.m
//  MengNavigation
//
//  Created by menglingchao on 2017/8/30.
//  Copyright © 2017年 Google Inc. All rights reserved.
//

#import "LCNavigationBar.h"

@implementation LCNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.items = @[self.navigationItem];
    }
    return self;
}
#pragma mark - Getter
- (UINavigationItem *)navigationItem {
    if (!_navigationItem) {
        _navigationItem = [[UINavigationItem alloc] init];
    }
    return _navigationItem;
}

@end
