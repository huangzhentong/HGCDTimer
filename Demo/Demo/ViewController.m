//
//  ViewController.m
//  Demo
//
//  Created by 送爱到家 on 2018/1/9.
//  Copyright © 2018年 送爱到家. All rights reserved.
//

#import "ViewController.h"
#import "HGCDTimer.h"
@interface ViewController ()
{
    HGCDTimer *timer;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroller  = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scroller.contentSize = CGSizeMake(0, 10000);
    [self.view addSubview:scroller];
    
//    [HGCDTimer initWithTimerInterval:<#(NSTimeInterval)#> withRuningBlock:<#^(void)block#>]
    
    timer = [[HGCDTimer alloc] initDisplayLinkWithFrameInterval:6 withRunloop:[NSRunLoop currentRunLoop] withMode:NSRunLoopCommonModes withBlock:^{
        NSLog(@"timer");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
