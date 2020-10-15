## 背景

随着公司业务的不断发展，项目的功能越来越复杂，各个业务代码耦合也越来越多，代码量也是急剧增加，传统的`MVC`或者`MVVM`架构已经无法高效的管理工程代码，因此需要用一种技术来更好地管理工程，而组件化（也可称为模块化）是一种能够解决代码耦合的技术。项目经过组件化的拆分，不仅可以解决代码耦合的问题，还可以增强代码的复用性，工程的易管理性等等。

## 市场上的方案：

### 方案一、url-block

这是蘑菇街中应用的一种页面间调用的方式，通过在启动时注册组件提供的服务，把调用组件使用的`url`和组件提供的服务`block`对应起来，保存到内存中。在使用组件的服务时，通过`url`找到对应的`block`，然后获取服务。

下图是`url-block`的架构图：

![url-block](./images/url-block.jpeg)

**注册：**

> ```objectivec
> [MGJRouter registerURLPattern:@"mgj://detail?id=:id" toHandler:^(NSDictionary *routerParameters) {
>  NSNumber *id = routerParameters[@"id"];
>  // create view controller with id
>  // push view controller
>    }];
> ```

**调用：**

> ```objectivec
> [MGJRouter openURL:@"mgj://detail?id=404"]
> ```

优点：

1. h5外跳到蘑菇街app，app内部的h5和app的原生交互，都可以直接使用这些定义好的路由。
2. 蘑菇街为了统一`iOS`和`Android`的平台差异性，专门用后台来管理`url`，然后针对不同的平台，生成不同类型的文件，来方便使用。

缺点：

1. 需要在内存中维护`url-block`的表，组件多了可能会有内存问题。
2. `url`的参数传递受到限制，只能传递常规的字符串参数，无法传递非常规参数，如`UIImage`、`NSData`等类型。
3. 没有区分本地调用和远程调用的情况，尤其是远程调用，会因为`url`参数受限，导致一些功能受限。
4. 组件本身依赖了中间件，且分散注册使的耦合较多。
5. url注册对于实施组件化是完全没有必要的，查找 URL 的实现不够高效。
6. 路由写错后编译没问题，而实现运行就出问题了，以后维护也不方便。

### 方案二、protocol-class

针对方案一的问题，蘑菇街又提出了另一种组件化的方案，就是通过`protocol`定义服务接口，组件通过实现该接口来提供接口定义的服务，具体实现就是把`protocol`和`class`做一个映射，同时在内存中保存一张映射表，使用的时候，就通过`protocol`找到对应的`class`来获取需要的服务。

下图是`protocol-class`的架构图：

![protocol-class](./images/protocol-class.jpeg)

**注册：**

> ```objectivec
> [ModuleManager registerClass:ClassA forProtocol:ProtocolA]
> ```

**调用：**

> ```objectivec
> [ModuleManager classForProtocol:ProtocolA]
> ```

优点：

1. 蘑菇街的这种方案确实解决了方案一中无法传递非常规参数的问题。
2. 组件间的调用更为方便。
3. 解耦代码量少，实现方便，以后维护也方便。
4. 协议方法改变后，编译就会报错，避免代码修改遗漏。
5. 协议方法未实现的话，会报编译警告。
6. 方法查找容易，调用高效。

缺点：

1. 组件的方法调用分散。
2. 内存中维护映射表。
3. 协议方法有可能未实现。
4. 对组件协议需要注册，不注册就无法调用。

### 方案三、url-controller

这是[LDBusMediator](https://github.com/Lede-Inc/LDBusMediator.git)的组件化方案，它是通过组件实现公共协议的服务，来对外提供服务。具体就是通过单例来维护`url-controller`的映射关系表，根据调用者的`url`，以及提供的参数（字典类型，所以参数类型不受约束）来返回对应的`controller`来提供服务；同时，为了增强组件提供服务的多样性，又通过服务协议定义了其它的服务。

下图是[LDBusMediator](https://github.com/Lede-Inc/LDBusMediator.git)的组件化架构图：

![LDBusMediator](./images/LDBusMediator.jpeg)

优点：

1. [LDBusMediator](https://github.com/Lede-Inc/LDBusMediator.git)解决了蘑菇街的这两种组件化方案的不足，比如：通过注册封装件`connector`而不是`block`来降低了内存占用。
2. 通过字典传递参数，解决了`url`参数的限制性。

缺点：

1. 内存中维护映射表。
2. 组件本身依赖了中间件，且分散注册使的耦合较多。
3. url注册对于实施组件化是完全没有必要的，查找 URL 的实现不够高效。
4. 路由写错后编译没问题，而实现运行就出问题了，以后维护也不方便。

### 方案四、target-action

通过给组件包装一层`wrapper`来给外界提供服务，然后调用者通过依赖中间件来使用服务；其中，中间件是通过`runtime`来调用组件的服务。具体实施过程是给组件封装一层`target`对象来对外提供服务；然后，通过实现中间件的`category`来提供服务给调用者，这样使用者只需要依赖中间件，而组件则不需要依赖中间件。

下图是[CTMediator](https://github.com/casatwy/CTMediator)的组件化方案架构图：

![CTMediator](./images/CTMediator.png)

下面代码来自[CTMediator](https://github.com/casatwy/CTMediator)的组件化[demo](https://github.com/casatwy/CTMediator.git)

**CTMediator分类**

```objective-c
// CTMediator+CTMediatorModuleAActions.h

- (UIViewController *)CTMediator_viewControllerForDetail;

// CTMediator+CTMediatorModuleAActions.m

- (UIViewController *)CTMediator_viewControllerForDetail
{
	return [self performTarget:@"TargetA" action:@"nativeFetchDetailViewController" params:@{@"key":@"value"} shouldCacheTarget:NO];
}
```

**target**

`A`组件

```objective-c
// Target_TargetA.h

- (UIViewController *)Action_nativeFetchDetailViewController:(NSDictionary *)params;
```

**调用**

```objective-c
// ViewController.h
#import "CTMediator+CTMediatorModuleAActions.h"

[self presentViewController:[[CTMediator sharedInstance] CTMediator_viewControllerForDetail] animated:YES completion:nil];
```

这就要求target类名要加前缀`Target_`，方法名要加前缀`Action_`，同时必须要有并且只有一个参数，参数类型必须是字典NSDictionary，还必须要要有返回参数，返回参数必须是指针类型，不能为int、float等C语言类型。

优点：

1. 内存中不需要维护映射表。
2. 不需要注册。

缺点：

1. 中间件实现繁琐。
2. 中间件方法类型、参数、返回值不够灵活。
3. 中间件方法内部使用字符串来调用方法和类，调用死板。
4. 中间件方法内部容易写错，写错后编译没问题，而实现运行就出问题了，以后维护也不方便。

### 方案五、Extension和Category结合使用

东方财富浪客直播的不同组件控制器跳转使用了这种方式，这个方式是我以前想出来的。在基础组件定义一个UIViewController 的Extension和Category，Extension里面封装各种组件间控制器跳转的调用方法，这里面没有实现，Category里面也和Extension对应封装相应方法，Category有实现，内部是调用的Extension封装的方法，调用时先判断Extension的方法有没有实现，做下保护。组件控制器跳转调用Category封装的方法。组件负责实现Extension定义的方法。

当然这种方案不只适用于控制器跳转，还可以改造成NSObject 的Extension和Category，适应所有的组件间通信。

Extension方法定义：

```objectivec
@interface UIViewController (EL)

/** 发直播 **/
- (void)el_startPushLive:(NSString *_Nullable)liveTitle;
```

Category方法定义：

```objectivec
@interface UIViewController (elbasic)

/** 发起直播 **/
- (void)elbasic_startPushLive:(NSString *_Nullable)liveTitle;
```

Category方法实现：

```objectivec
@implementation UIViewController (elbasic)

/** 发起直播 **/
- (void)elbasic_startPushLive:(NSString *_Nullable)liveTitle {
   SEL sel = @selector(el_startPushLive:);
   if ([self respondsToSelector:sel]) {
       [self el_startPushLive:liveTitle];
   }
}
```

Extension方法实现：

```objectivec
@implementation UIViewController ()

//发直播
- (void)el_startPushLive:(NSString *_Nullable)liveTitle {
   UIViewController *pCtrl = [SBURLActionsb_initCtrl:el_actionurl_push_live(liveTitle)];
   [self el_presentPushCtrl:pCtrl];
}
```

优点：

1. Category实现内部做了Extension方法是否实现的判断，避免了不实现出现的崩溃
2. 确实解决了方案一中无法传递非常规参数的问题
3. 组件间的调用方便。
4. 协议方法改变后，编译就会报错，避免代码修改遗漏。
5. 内存中不需要维护映射表。

缺点：

1. Extension和Category都定义了同样的方法，相比protocol-class方案不够简洁。
2. 方法为了避免冲突，都要加前缀。

## 总结：

组件化是项目架构层面的技术，不是所有项目都适合组件化，组件化一般针对的是大中型的项目，并且是多人开发。如果，项目比较小，开发人员比较少，确实不太适合组件化，因为这时的组件化可能带来的不是便捷，而是增加了开发的工作量。另外，组件化过程也要考虑团队的情况，总之，根据目前项目的情况作出最合适的技术选型。没有最好的技术，只有最合适的技术。

最后我还是推荐下我的组件化解耦方案，文章地址是https://blog.csdn.net/mlcldh/article/details/81190992，GitHub地址是https://github.com/mlcldh/LCLive。

