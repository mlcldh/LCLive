//
//  LCMediatorHeader.h
//  Pods
//
//  Created by MengLingChao on 2018/7/8.
//

#ifndef LCMediatorHeader_h
#define LCMediatorHeader_h

Class LCModuleClassFromProtocol(Protocol *protocol) {
    NSString *className = NSStringFromProtocol(protocol);
    Class aClass = NSClassFromString(className);
    if ([aClass conformsToProtocol:protocol]){
        return aClass;
    }
    return nil;
}

#endif /* LCMediatorHeader_h */
