//
//  LCMediatorHeader.h
//  Pods
//
//  Created by MengLingChao on 2018/7/8.
//

#ifndef LCMediatorHeader_h
#define LCMediatorHeader_h

/**根据传入的组件协议返回实现该协议的类的对象*/
NS_INLINE id LCModuleInstanceFromProtocol(Protocol *protocol) {
    NSString *className = NSStringFromProtocol(protocol);
    Class aClass = NSClassFromString(className);
//    NSLog(@"class %@,%@",className,aClass);
    static NSMutableDictionary *modulesDictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modulesDictionary = [NSMutableDictionary dictionary];
    });
    id module = modulesDictionary[className];
    if (!module) {
        module = [[aClass alloc]init];
        modulesDictionary[className] = module;
    }
    if ([module conformsToProtocol:protocol]){
        return module;
    }
    return nil;
}

//将模块实例赋值到变量module，适合局部代码获取多次模块实例的情况
#define LCModuleInstance(module,LCModuleProtocol) id<LCModuleProtocol> module = LCModuleInstanceFromProtocol(@protocol(LCModuleProtocol));
//返回模块实例，适合局部代码获取一次模块实例的情况
#define LCGetModuleInstance(LCModuleProtocol) ((id<LCModuleProtocol>)(LCModuleInstanceFromProtocol(@protocol(LCModuleProtocol))))

#endif /* LCMediatorHeader_h */
