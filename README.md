# LCLive
讲解组件化解耦的直播demo。
现在是将个组件代码和主工程放到了一个Git工程里，当然实际应该是放到不同Git工程的。

LCLive是主工程。
LCMediator是调度层。
LCBase是基础模块，封装公共类和方法。
LCWeb是h5、weex模块。
LCChat是私信模块。
LCMomment是直播朋友圈模块。
