//
//  TBShakeViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/8.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBShakeViewController.h"
#import "TBShakeViewModel.h"
#import <AudioToolbox/AudioToolbox.h>

@interface TBShakeViewController ()
@property (nonatomic,strong) TBShakeViewModel *shakeVM;
@end

@implementation TBShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.shakeVM = [[TBShakeViewModel alloc]initWithTarget:self];
    
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self resignFirstResponder];
}
#pragma mark - ShakeToEdit 摇动手机之后的回调方法

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //检测到摇动开始
    if (motion == UIEventSubtypeMotionShake)
    {
        // your code
        NSLog(@"检测到摇动开始");
        AudioServicesPlaySystemSound(1009);//振
        [self.shakeVM startShake];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //摇动取消
    NSLog(@"摇动取消");
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //摇动结束
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        // your code
        NSLog(@"摇动结束");
//        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);//振动效果 需要#import <AudioToolbox/AudioToolbox.h>
        
    }
    
}
@end
