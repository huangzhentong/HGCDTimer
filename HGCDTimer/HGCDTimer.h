//
//  GCDTimer.h
//  CountDownTimer
//
//  Created by 送爱到家 on 2018/1/8.
//  Copyright © 2018年 送爱到家. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IOS
#import <QuartzCore/QuartzCore.h>
#endif
@interface HGCDTimer : NSObject


#pragma makr - GCD 
//默认为主线程 计时器时间，以及 block
+(instancetype)initWithTimerInterval:(NSTimeInterval)timer  withRuningBlock:(dispatch_block_t)block;
-(instancetype)initWithTimerInterval:(NSTimeInterval)timer  withRuningBlock:(dispatch_block_t)block;

+(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block;
-(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block;

+(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block withCancelBlock:(dispatch_block_t)cancelBlock;
-(instancetype)initWithTimerInterval:(NSTimeInterval)timer withQueue:(dispatch_queue_t)queue withRuningBlock:(dispatch_block_t)block withCancelBlock:(dispatch_block_t)cancelBlock;




#pragma mark displayLink










//帧计时器
#if TARGET_OS_IOS

+(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withBlock:(dispatch_block_t)block;

-(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withBlock:(dispatch_block_t)block;

+(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withRunloop:(NSRunLoop*)runloop withMode:(NSRunLoopMode)mode withBlock:(dispatch_block_t)block;

-(instancetype)initDisplayLinkWithFrameInterval:(NSInteger)frameInterval withRunloop:(NSRunLoop*)runloop withMode:(NSRunLoopMode)mode withBlock:(dispatch_block_t)block;

#endif

-(void)invalidate;
@end
