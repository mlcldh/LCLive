# LCLive
讲解通过协议实现组件化解耦的直播demo。
现在是将各个组件代码和主工程放到了一个Git工程里，当然实际应该是放到不同Git工程的。

主工程依赖这些组件。LCLive是主工程。 LCMediator是调度层中间件。 LCBase是基础模块，封装公共类和方法。 LCWeb是h5、weex模块。 LCChat是私信模块。 LCMomment是朋友圈模块。

![图片 7](https://raw.github.com/mlcldh/LCLive/master/images/图片7.jpg)

中间件是LCMediator，它里面定义了User、私信、Web、Moment等协议，供相应组件实现了和供其他组件调用。

![图片 8](https://raw.github.com/mlcldh/LCLive/master/images/图片8.png)

通过NSClassFromString方法获取到类后，写代码让该类执行类方法时，Xcode不会给提示，毕竟Xcode无法只提供Class这一个类型就判断出具体是那种类。既然不给提示，就要自己将代码复制过去，然后编译也没问题。但如果复制成了其他类方法，只要这个类方法能够引用到，编译就不会报错，这样就会出问题了。这样因为Xcode对类方法编译不够友好，将所有组件协议方法都写成实例方法。

LCMediator的LCMediatorHeader里通过传入的组件协议返回实现该协议的类的实例。 方法LCModuleInstanceFromProtocol获取到的也就只是实例对象。调用组件协议实例时，不需要提前注册，LCModuleInstanceFromProtocol内部做了懒加载处理。

![图片 9](https://raw.github.com/mlcldh/LCLive/master/images/图片9.jpg)

![图片 10](https://raw.github.com/mlcldh/LCLive/master/images/图片10.jpg)

![图片 11](https://raw.github.com/mlcldh/LCLive/master/images/图片11.png)

![图片 12](https://raw.github.com/mlcldh/LCLive/master/images/图片12.jpg)

![图片 13](https://raw.github.com/mlcldh/LCLive/master/images/图片13.jpg)

LCWeb是h5、weex模块。 LCWebModule里面实现协议提供跳转到H5的方法。

![图片 14](https://raw.github.com/mlcldh/LCLive/master/images/图片14.png)

LCChat是私信模块。LCChatModule提供读取消息未读数和跳转到单例详情的方法。

![图片 15](https://raw.github.com/mlcldh/LCLive/master/images/图片15.png)

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
3. 获取组件协议实现的实例对象，只能使用LCModuleInstance(module,LCModuleProtocol) 这个宏，从而避免直接使用LCModuleInstanceFromProtocol获取到实现类，让实现类执行了其并不遵守的协议方法。
4. 组件协议实现的实例对象只是用来负责组件通信的，不用用它们来存储其他东西，因为这些事例对象一直不会去释放，存储太多东西，容易出现内存占用过多的问题。

