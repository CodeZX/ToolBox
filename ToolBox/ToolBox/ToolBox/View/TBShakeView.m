//
//  TBShakeView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBShakeView.h"


@interface TBShakeView ()<CAAnimationDelegate>
@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UIImageView *shakeImageView;
@end
@implementation TBShakeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    backgroundImageView.backgroundColor = [UIColor redColor];
    [self addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIImageView *shakeImageView = [[UIImageView alloc]init];
    shakeImageView.backgroundColor  = [UIColor blueColor];
    [self addSubview:shakeImageView];
    self.shakeImageView = shakeImageView;
    [self.shakeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.backgroundImageView);
        make.height.equalTo(100);
        make.width.equalTo(80);
    }];
    
}


- (void)startSharke {
    
    [self theAnimations];
    
 
}

- (void)stopSharke {
    
    
}
 

#define angle2Radian(angle)  ((angle)/180.0*M_PI)
-(void)theAnimations{
    
    CAKeyframeAnimation *keyAnima;
    //1.创建核心动画
    keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    self.shakeImageView.layer.position = CGPointMake(self.shakeImageView.frame.origin.x +self.shakeImageView.frame.size.width/2,
                                         self.shakeImageView.frame.origin.y +self.shakeImageView.frame.size.height);
    self.shakeImageView.layer.anchorPoint = CGPointMake(0.5, 1);
    //设置图标抖动弧度  把度数转换为弧度  度数/180*M_PI
    keyAnima.values = @[@(angle2Radian(0)),
                        @(-angle2Radian(8)),
                        @(angle2Radian(0)),
                        @(angle2Radian(8)),
                        @(angle2Radian(0))];
    //设置动画时间
    keyAnima.duration = .7;
    //设置动画的重复次数(设置为最大值)
    keyAnima.repeatCount = 1;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.removedOnCompletion = NO;
    keyAnima.delegate = self;
    [self.shakeImageView.layer addAnimation:keyAnima forKey:@"animateLayer"];
}
-(void)animationDidStart:(CAAnimation *)anim{
    //动画开始
    NSLog(@"动画开始啦！！！！！");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //结束动画执行事件
    NSLog(@"动画结束啦~~~~~");
}
@end
