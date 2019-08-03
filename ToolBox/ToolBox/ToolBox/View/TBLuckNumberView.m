//
//  TBLuckNumberView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/15.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLuckNumberView.h"
#import "TBBallView.h"

@interface TBLuckNumberView ()<CAAnimationDelegate>


@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIImageView *plusImageView;
@property (nonatomic,strong) NSMutableArray *numberBallArray;
@property (nonatomic,strong) NSMutableArray *numberLotteryArray;
@property (nonatomic,copy)  void (^completion)(BOOL finished);

@end
@implementation TBLuckNumberView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_tool_lucky_lottery2.jpg"]];
//    backgroundImageView.backgroundColor = [UIColor redColor];
    [self addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
//        make.center.equalTo(self);
    }];
    

    for (int index = 0; index < 8; index++) {
        
        UIImageView *lastBallView = [self.numberBallArray lastObject];
        if (index != 6) {
            TBBallView *ballView = [[TBBallView alloc]init];
            ballView.alpha = 0;
            [self addSubview:ballView];
            [ballView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.size.equalTo(CGSizeMake(30,30));
                if (lastBallView) {
                    make.left.equalTo(lastBallView.right).offset(10);
                }else {
                    make.left.equalTo(self).offset(20);
                }
            }];
            [self.numberBallArray addObject:ballView];
        } else {
            UIImageView *plusImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_lucky_jiahao"]];
            [self addSubview:plusImageView];
            self.plusImageView = plusImageView;
            [plusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self).offset(10);
                make.size.equalTo(CGSizeMake(20,20));
                make.left.equalTo(lastBallView.right).offset(10);
            }];
             [self.numberBallArray addObject:plusImageView];
            
        }
        
    }
    
}

- (void)startLottery:(void (^)(BOOL))completion {
    
    self.completion = completion;
    [self setLotteryNumber];
    for (int index = 0; index < self.numberBallArray.count; index++) {
        if (index != 6) {
            [self setNumberBallAnimation:self.numberBallArray[index] delay:index/1.0];
        }
        
    }
    
}

- (BOOL)checkForNumber:(NSNumber *)randomNumber {
    
    for (NSNumber *number in self.numberLotteryArray) {
        if ([number isEqualToNumber:randomNumber]) {
            return NO;
        }
    }
    return YES;
}

- (void)setLotteryNumber {
    
    BOOL stop = NO;
    [self.numberLotteryArray removeAllObjects];
    do {
        
        NSNumber *randomNumber = [NSNumber numberWithInt:( random() % 49 + 1)];
        if ([self checkForNumber:randomNumber]) {
            [self.numberLotteryArray addObject:randomNumber];
        }
        
        if (self.numberLotteryArray.count == 7) {
            stop = YES;
        }
    } while (!stop);
    
    
    for (int index = 0; index < 7; index++) {
        TBBallView * ballView = self.numberBallArray[index];
        NSNumber *randomNumber = self.numberLotteryArray[index];
        if (index == 6) {
            ballView = [self.numberBallArray lastObject];
        }
        ballView.numberString = [randomNumber stringValue];
    }
    
    
}



- (void)setNumberBallAnimation:(TBBallView *)numberBall delay:(CFTimeInterval)delay{
    
    [numberBall.layer removeAllAnimations];
    CABasicAnimation *moveAnimation = [[CABasicAnimation alloc]init];
    moveAnimation.keyPath = @"position.x";
    moveAnimation.fromValue = @(-10);
    moveAnimation.toValue = @(numberBall.layer.position.x);
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    
    CABasicAnimation *showAnimation = [[CABasicAnimation alloc]init];
    showAnimation.keyPath = @"opacity";
    showAnimation.fromValue = @(0.7);
    showAnimation.toValue = @(1);
    
    CABasicAnimation *scaleAnimation = [[CABasicAnimation alloc]init];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.fromValue = @(0.8);
    scaleAnimation.toValue = @(1);
    

    
    CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
    group.animations = @[moveAnimation,showAnimation,scaleAnimation];
    group.duration = 2.8;
    group.beginTime = CACurrentMediaTime() + delay/6;
    group.fillMode = kCAFillModeForwards;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.removedOnCompletion = NO;
    group.delegate = self;
    [numberBall.layer addAnimation:group forKey:@"show"];
    
}



- (void)animationDidStart:(CAAnimation *)anim {
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    self.completion(YES);
}

- (NSMutableArray *)numberLotteryArray {
    if (!_numberLotteryArray) {
        _numberLotteryArray = [[NSMutableArray alloc]init];
    }
    return _numberLotteryArray;
}

- (NSMutableArray *)numberBallArray {
    if (!_numberBallArray) {
        _numberBallArray = [[NSMutableArray alloc]init];
        
    }
    
    return _numberBallArray;
}
@end
