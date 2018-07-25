//
//  LCMediatorHeader.h
//  Pods
//
//  Created by MengLingChao on 2018/7/8.
//

#ifndef LCMediatorHeader_h
#define LCMediatorHeader_h

/**根据传入的组件协议返回实现该协议的类*/
Class LCModuleClassFromProtocol(Protocol *protocol) {
    NSString *className = NSStringFromProtocol(protocol);
    Class aClass = NSClassFromString(className);
    if ([aClass conformsToProtocol:protocol]){
        return aClass;
    }
    return nil;
}

#endif /* LCMediatorHeader_h */
