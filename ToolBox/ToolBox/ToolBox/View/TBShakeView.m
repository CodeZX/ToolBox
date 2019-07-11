//
//  TBShakeView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBShakeView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface TBShakeView ()<CAAnimationDelegate>

#define angle2Radian(angle)  ((angle)/180.0*M_PI)
@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UIImageView *shakeImageView;
@property (nonatomic,weak) NSArray *numberBallArray;
@property (nonatomic,weak) UIImageView *centerNumberBallImageView;
@property (nonatomic,weak) UIImageView *leftNumberBallImageView;
@property (nonatomic,weak) UIImageView *rightNumberBallImageView;
@property (nonatomic,copy) void (^completion)(BOOL finished);

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
    
    UIImageView *centerNumberBallImageView = [[UIImageView alloc]init];
    centerNumberBallImageView.backgroundColor = [UIColor orangeColor];
    centerNumberBallImageView.alpha  = 0;
    [self addSubview:centerNumberBallImageView];
    self.centerNumberBallImageView = centerNumberBallImageView;
    [centerNumberBallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(self.left).offset(10);
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    UIImageView *leftNumberBallImageView = [[UIImageView alloc]init];
    leftNumberBallImageView.backgroundColor = [UIColor yellowColor];
    leftNumberBallImageView.alpha = 0;
    [self addSubview:leftNumberBallImageView];
    self.leftNumberBallImageView = leftNumberBallImageView;
    [leftNumberBallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(centerNumberBallImageView.left).offset(-20);
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    

    
    UIImageView *rightNumberBallImageView = [[UIImageView alloc]init];
    rightNumberBallImageView.backgroundColor = [UIColor blackColor];
    rightNumberBallImageView.alpha = 0;
    [self addSubview:rightNumberBallImageView];
    self.rightNumberBallImageView = rightNumberBallImageView;
    [rightNumberBallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerNumberBallImageView.right).offset(20);
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
}



- (void)startSharke:(void (^)(BOOL))completion {
    
    self.completion = completion;
    AudioServicesPlaySystemSound(1010);//振
    CAKeyframeAnimation *keyAnima;
    //1.创建核心动画
    keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    self.shakeImageView.layer.position = CGPointMake(self.shakeImageView.frame.origin.x + self.shakeImageView.frame.size.width/2,
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
    [self.shakeImageView.layer addAnimation:keyAnima forKey:@"animateLayer"];
    
    [self startForecastAnimationDelay:0.8];
}

- (void)startForecastAnimationDelay:(CFTimeInterval)delay {
    
    [self hideShakeImageViewAnimationBeginTime:CACurrentMediaTime() + delay forKey:@"showShakeAnimation"];
    [self setAnimation:self.leftNumberBallImageView beginTime:CACurrentMediaTime() + delay forKey:@"leftAnimation" delegate:nil];
    [self setAnimation:self.centerNumberBallImageView beginTime:CACurrentMediaTime() + delay + 0.2 forKey:@"centerAnimation" delegate:nil];
    [self setAnimation:self.rightNumberBallImageView beginTime:CACurrentMediaTime() + delay + 0.4 forKey:@"rightAnimation" delegate:self];
    
    
}

- (void)stopSharke {
    
    
}



-(void)animationDidStart:(CAAnimation *)anim{
    //动画开始
    NSLog(@"动画开始啦！！！！！");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //结束动画执行事件
    NSLog(@"动画结束啦~~~~~");
    self.completion(YES);

}


- (void)hideShakeImageViewAnimationBeginTime:(CFTimeInterval)beginTime forKey:(NSString *)key {
    
    CABasicAnimation *hideShakeAnimation = [[CABasicAnimation alloc]init];
    hideShakeAnimation.keyPath = @"opacity";
    hideShakeAnimation.fromValue = @(1);
    hideShakeAnimation.toValue  = @(0);
    hideShakeAnimation.duration = .2;
    hideShakeAnimation.beginTime =  beginTime;
    hideShakeAnimation.fillMode =  kCAFillModeForwards;
    hideShakeAnimation.removedOnCompletion = NO;
    hideShakeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.shakeImageView.layer addAnimation:hideShakeAnimation forKey:key];
    
    
}

- (void)setAnimation:(UIImageView *)numberBallImageView beginTime:(CFTimeInterval)beginTime forKey:(NSString *)key delegate:(id)delegate {
    
    CABasicAnimation *moveAnimation = [[CABasicAnimation alloc]init];
    moveAnimation.keyPath = @"position.y";
    moveAnimation.fromValue = @(self.leftNumberBallImageView.center.y + 30);
    moveAnimation.toValue = @(self.leftNumberBallImageView.center.y);
    moveAnimation.duration = .3;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    if (delegate) {
//        moveAnimation.delegate = delegate;
//    }
    
    CABasicAnimation *alphaAnimation = [[CABasicAnimation alloc]init];
    alphaAnimation.keyPath = @"opacity";
    alphaAnimation.fromValue = @(0);
    alphaAnimation.toValue  = @(1);
    alphaAnimation.duration = .3;
    alphaAnimation.fillMode =  kCAFillModeForwards;
    alphaAnimation.removedOnCompletion = NO;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = .3;
    group.removedOnCompletion = NO;
    group.repeatCount = 1;
    group.fillMode = kCAFillModeForwards;
    group.beginTime = beginTime;
    if (delegate) {
        group.delegate = delegate;
    }
    
    [group setAnimations:@[moveAnimation,alphaAnimation]];
    [numberBallImageView.layer addAnimation:group forKey:key];
    
    
}
@end
