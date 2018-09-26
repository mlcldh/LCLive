# LCLive
讲解通过协议实现组件化解耦的直播demo。
现在是将各个组件代码和主工程放到了一个Git工程里，当然实际应该是放到不同Git工程的。

主工程依赖这些组件。LCLive是主工程。 LCMediator是调度层中间件。 LCBase是基础模块，封装公共类和方法。 LCWeb是h5、weex模块。 LCChat是私信模块。 LCMomment是朋友圈模块。

![图片 7](https://raw.github.com/mlcldh/LCLive/master/images/图片7.png)

中间件是LCMediator，它里面定义了User、私信、Web、Moment等协议，供相应组件实现了和供其他组件调用。

![图片 8](https://raw.github.com/mlcldh/LCLive/master/images/图片 8.png)

LCMediator的LCMediatorHeader里通过传入的组件协议返回实现该协议的类的实例。因为Xcode对类方法编译不够友好，将所有组件协议方法都写成实例方法。 方法LCModuleInstanceFromProtocol获取到的也就只是实例对象。

![图片 9](https://raw.github.com/mlcldh/LCLive/master/images/图片 9.jpg)

![图片 10](https://raw.github.com/mlcldh/LCLive/master/images/图片 10.jpg)

![图片 11](https://raw.github.com/mlcldh/LCLive/master/images/图片 11.png)

![图片 12](https://raw.github.com/mlcldh/LCLive/master/images/图片 12.jpg)

![图片 13](https://raw.github.com/mlcldh/LCLive/master/images/图片 13.jpg)

LCWeb是h5、weex模块。 LCWebModule里面实现协议提供跳转到H5的方法。

![图片 14](https://raw.github.com/mlcldh/LCLive/master/images/图片 14.png)

LCChat是私信模块。LCChatModule提供读取消息未读数和跳转到单例详情的方法。

![图片 15](https://raw.github.com/mlcldh/LCLive/master/images/图片 15.png)
