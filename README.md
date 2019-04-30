# LCLive
讲解通过协议实现组件化解耦的直播demo。
现在是将各个组件代码和主工程放到了一个Git工程里，当然实际应该是放到不同Git工程的。

主工程依赖这些组件。LCLive是主工程。 LCMediator是调度层中间件。 LCBase是基础模块，封装公共类和方法。LCShare是分享模块。LCUser是用户信息模块。 LCWeb是h5、weex模块。 LCChat是私信模块。 LCMomment是朋友圈模块。LCMe是用户信息展示模块。LCLaunchModule是负责处理app启动后操作的模块。

Podfile如下：

```objective-c
platform :ios, '8.0'
use_frameworks!

source 'https://github.com/CocoaPods/Specs.git'

target 'LCLive' do

pod 'LCMediator', :path => '../LCMediator'
pod 'LCBase', :path => '../LCBase'
pod 'LCUser', :path => '../LCUser'
pod 'LCShare', :path => '../LCShare'
pod 'LCMe', :path => '../LCMe'
pod 'LCChat', :path => '../LCChat'
pod 'LCWeb', :path => '../LCWeb'
pod 'LCMoment', :path => '../LCMoment'
pod 'LCLaunch', :path => '../LCLaunch'

end
```

中间件是LCMediator，它里面定义了User、私信、Web、Moment等协议，供相应组件实现和供其他组件调用。

![图片 8](https://raw.github.com/mlcldh/LCLive/master/images/图片8.png)

通过NSClassFromString方法获取到类后，写代码让该类执行类方法时，Xcode不会给提示，毕竟Xcode无法只提供Class这一个类型就判断出具体是那种类。既然不给提示，就要自己将代码复制过去，然后编译也没问题。但如果复制成了其他类方法，只要这个类方法能够引用到，编译就不会报错，这样就会出问题了。这样因为Xcode对类方法编译不够友好，将所有组件协议方法都写成实例方法。

LCMediator的LCMediatorHeader里通过传入的组件协议返回实现该协议的类的实例。 方法LCModuleInstanceFromProtocol获取到的也就只是实例对象。调用组件协议实例时，不需要提前注册，LCModuleInstanceFromProtocol内部做了懒加载处理。

```objective-c
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

#define LCModuleInstance(module,LCModuleProtocol) id<LCModuleProtocol> module = LCModuleInstanceFromProtocol(@protocol(LCModuleProtocol));
#define LCGetModuleInstance(LCModuleProtocol) ((id<LCModuleProtocol>)(LCModuleInstanceFromProtocol(@protocol(LCModuleProtocol))))
```



```objective-c
/**用户信息模块*/
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
```



```objective-c
@interface LCUserModule : NSObject<LCUserModule>

@end
```



```objective-c
@implementation LCUserModule

- (NSString *)userId {
    return @"abc123100";
}
- (NSString *)token {
    return @"qwe007what";
}
- (NSString *)nickname {
    return @"李明";
}
- (NSString *)avatarUrlString {
    return @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3843887011,4044287239&fm=173&app=25&f=JPEG?w=218&h=146&s=F81821D40331ABCC106BAA8003008088";
//    return @"https://avatar.csdn.net/7/5/6/1_mlcldh.jpg?1532075030";
}

@end
```

```objective-c
_nicknameLabel.text = [LCGetModuleInstance(LCUserModule) nickname];
```

LCWeb是h5、weex模块。 LCWebModule里面实现协议提供跳转到H5的方法。

```objective-c
@implementation LCWebModule

- (void)pushWebViewControllerWithUrlString:(NSString *)urlString fromViewController:(UIViewController *)viewController {
    LCWebViewController *webVC = [[LCWebViewController alloc]init];
    webVC.urlString = urlString;
    [viewController.navigationController pushViewController:webVC animated:YES];
}

@end
```

LCChat是私信模块。LCChatModule提供读取消息未读数和跳转到单聊详情的方法。

```objective-c
@implementation LCChatModule

- (UIViewController *)sessionListViewController {
    LCSessionListViewController *vc = [[LCSessionListViewController alloc]init];
    return vc;
}
- (NSUInteger)unreadCount {
    return 3;
}
- (void)pushUserChatViewControllerWithUserId:(NSString *)userId fromViewController:(UIViewController *)viewController {
    LCUserChatViewController *userChatVC = [[LCUserChatViewController alloc]init];
    [viewController.navigationController pushViewController:userChatVC animated:YES];
}

@end
```



#### 优点：

1. 组件间的调用更为方便。
2. 解耦代码量少，实现方便，以后维护也方便。
3. 协议方法改变后，编译就会报错，避免代码修改遗漏。
4. 协议方法未实现的话，会报编译警告。
5. 方法查找容易，调用高效。
6. 不需要注册即可调用。

#### 缺点：

1. 组件的方法调用分散。
2. 内存中维护映射表。
3. 协议方法有可能未实现，调用会导致崩溃。

#### 使用注意事项：

1. 组件协议的方法都要写成实例方法，不要写成类方法。
2. 组件协议的方法都要实现，因为调用时不会去判断方法有没有实现。
3. 获取组件协议实现的实例对象，只能使用LCModuleInstance(module,LCModuleProtocol) 或LCGetModuleInstance(LCModuleProtocol)这两个个宏，从而避免直接使用LCModuleInstanceFromProtocol获取到实现类，让实现类执行了其并不遵守的协议方法。
4. 组件协议实现的实例对象只是用来负责组件通信的，不要用它们来存储其他东西，因为这些实例对象一直不会去释放，存储太多东西，容易出现内存占用过多的问题。

