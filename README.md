# HGCDTimer
封装GCD的计时器
可以快捷的使用,使用时记得保存实例变量，否刚计时器不会被添加到线程中
 1 。
 
 [HGCDTimer initWithTimerInterval:1 withRuningBlock:^{}];
 
2 第二种为帧计时器，更多用于动画方面
timer = [[HGCDTimer alloc] initDisplayLinkWithFrameInterval:6 withRunloop:[NSRunLoop currentRunLoop] withMode:NSRunLoopCommonModes withBlock:^{
NSLog(@"timer");
}];

可以用cocoapod 安装
pod 'HGCDTimer'
