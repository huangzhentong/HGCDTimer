//
//  GCDTimer.m
//  CountDownTimer
//
//  Created by 送爱到家 on 2018/1/8.
//  Copyright © 2018年 送爱到家. All rights reserved.
//

#import "HGCDTimer.h"


@interface HGCDTimer()
{
    dispatch_source_t _timer;
#if TARGET_OS_IOS
    CADisplayLink *displayLink;
#endif
}
@property(nonatomic,copy)dispatch_block_t block;


@end

@implementation HGCDTimer

#pragma mark  GCD

+(instancetype)initWithTimerInterval:(NSTimeInterval)timer withRuningBlock:(void (^)(void))block
{
    return [[self alloc] initWithTimerInterval:timer withRuningBlock:block];
}
-(instancetype)initWithTimerInterval:(NSTimeInterval)timer  withRuningBlock:(void(^)(void))block
{
    return   [self initWithTimerInterval:timer withQueue:dispatch_get_main_queue() withRuningBlock:block];
}



+(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(void (^)(void))block
{
    return [[self alloc] initWithTimerInterval:timer withQueue:queue withRuningBlock:block];
}

-(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(void(^)(void))block
{
    return  [self initWithTimerInterval:timer withQueue:queue withRuningBlock:block withCancelBlock:nil];
}

+(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block withCancelBlock:(dispatch_block_t)cancelBlock
{
    return [[self alloc] initWithTimerInterval:timer withQueue:queue withRuningBlock:block withCancelBlock:cancelBlock];
}
-(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block withCancelBlock:(dispatch_block_t)cancelBlock
{
    self = [super init];
    if (self) {
        
  
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue?:dispatch_get_main_queue());
        dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, fabs(timer) * NSEC_PER_SEC, 0);
        
        // 计时器的触发block
        dispatch_source_set_event_handler(_timer, block);
        
        // 计时器cancel的时候触发的block
        dispatch_source_set_cancel_handler(_timer, cancelBlock);
        
        // 因为dispatch_source启动时默认是挂起状态的，需要手动启动。
        dispatch_resume(_timer);
        
    }
    return self;
}


#pragma mark - 帧计时器

#if TARGET_OS_IOS

+(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withBlock:(dispatch_block_t)block
{
   return  [[self alloc] initDisplayLinkWithFrameInterval:frameInterval withBlock:block];
}
-(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withBlock:(dispatch_block_t)block
{
   return  [self initDisplayLinkWithFrameInterval:frameInterval withRunloop:[NSRunLoop currentRunLoop] withMode:NSRunLoopCommonModes withBlock:block];
}

+(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withRunloop:(NSRunLoop *)runloop withMode:(NSRunLoopMode)mode withBlock:(dispatch_block_t)block
{
    return [[self alloc] initDisplayLinkWithFrameInterval:frameInterval withRunloop:runloop withMode:mode withBlock:block];
}

-(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withRunloop:(NSRunLoop*)runloop withMode:(NSRunLoopMode)mode withBlock:(dispatch_block_t)block;
{
    self = [super init];
    if (self) {
#if TARGET_OS_IOS
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkUpdateEvent:)];

//        displayLink.frameInterval = frameInterval;
        [displayLink addToRunLoop:runloop?:[NSRunLoop currentRunLoop] forMode:mode?:NSRunLoopCommonModes];
        self.block =  block;
#endif
    }
    return self;
}

-(void)displayLinkUpdateEvent:(CADisplayLink*)link
{
    if (self.block) {
        self.block();
    }
}

#endif

#pragma mark -

-(void)invalidate
{
    if (_timer) {
        dispatch_source_cancel(_timer);
    }
    #if TARGET_OS_IOS
    if (displayLink) {
        [displayLink invalidate];
        displayLink = nil;
    }
    #endif
}
-(void)dealloc
{
    [self invalidate];
    NSLog(@"GCDTimer  is dealloc");
}
@end
