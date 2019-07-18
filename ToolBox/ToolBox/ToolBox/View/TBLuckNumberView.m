//
//  TBLuckNumberView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/15.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLuckNumberView.h"


@interface TBLuckNumberView ()<CAAnimationDelegate>


@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIImageView *plusImageView;
@property (nonatomic,strong) NSMutableArray *numberBallArray;
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
    
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    backgroundImageView.backgroundColor = [UIColor redColor];
    [self addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"幸运号码";
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.centerX.equalTo(self);
    }];
    
    UIImageView *numberBall_1 = [[UIImageView alloc]init];
    numberBall_1.backgroundColor = [UIColor orangeColor];
    numberBall_1.alpha = 0;
    [self addSubview:numberBall_1];
    [self.numberBallArray addObject:numberBall_1];
    [numberBall_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
 
    UIImageView *numberBall_2 = [[UIImageView alloc]init];
    numberBall_2.backgroundColor = [UIColor yellowColor];
    numberBall_2.alpha = 0;
    [self addSubview:numberBall_2];
    [self.numberBallArray addObject:numberBall_2];
    [numberBall_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_1.right).offset(10);
        make.centerY.equalTo(numberBall_1);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
    UIImageView *numberBall_3 = [[UIImageView alloc]init];
    numberBall_3.backgroundColor = [UIColor yellowColor];
    numberBall_3.alpha = 0;
    [self addSubview:numberBall_3];
    [self.numberBallArray addObject:numberBall_3];
    [numberBall_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_2.right).offset(10);
        make.centerY.equalTo(numberBall_2);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
    UIImageView *numberBall_4 = [[UIImageView alloc]init];
    numberBall_4.backgroundColor = [UIColor yellowColor];
    numberBall_4.alpha = 0;
    [self addSubview:numberBall_4];
    [self.numberBallArray addObject:numberBall_4];
    [numberBall_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_3.right).offset(10);
        make.centerY.equalTo(numberBall_3);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
    UIImageView *numberBall_5 = [[UIImageView alloc]init];
    numberBall_5.backgroundColor = [UIColor yellowColor];
    numberBall_5.alpha = 0;
    [self addSubview:numberBall_5];
    [self.numberBallArray addObject:numberBall_5];
    [numberBall_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_4.right).offset(10);
        make.centerY.equalTo(numberBall_4);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
    UIImageView *numberBall_6 = [[UIImageView alloc]init];
    numberBall_6.backgroundColor = [UIColor yellowColor];
    numberBall_6.alpha = 0;
    [self addSubview:numberBall_6];
    [self.numberBallArray addObject:numberBall_6];
    [numberBall_6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_5.right).offset(10);
        make.centerY.equalTo(numberBall_5);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
   
    UIImageView *plusImageView = [[UIImageView alloc]init];
    plusImageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:plusImageView];
    self.plusImageView = plusImageView;
    [plusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(numberBall_6.right).offset(10);
        make.centerY.equalTo(numberBall_6);
        make.size.equalTo(CGSizeMake(40,40));
    }];
    
    UIImageView *numberBall_7 = [[UIImageView alloc]init];
    numberBall_7.backgroundColor = [UIColor blueColor];
    numberBall_7.alpha = 0;
    [self addSubview:numberBall_7];
    [self.numberBallArray addObject:numberBall_7];
    [numberBall_7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(plusImageView.right).offset(10);
        make.centerY.equalTo(plusImageView);
        make.size.equalTo(CGSizeMake(30,30));
    }];
    
   
    
    
}

- (void)startLottery:(void (^)(BOOL))completion {
    
    self.completion = completion;
    
    for (int index = 0; index < self.numberBallArray.count; index++) {
        [self setNumberBallAnimation:self.numberBallArray[index] delay:index/1.0];
    }
    
}



- (void)setNumberBallAnimation:(UIImageView *)numberBall delay:(CFTimeInterval)delay{
    
   
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
    group.duration =  1.5;
    group.beginTime = CACurrentMediaTime() + delay/6;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.delegate = self;
    [numberBall.layer addAnimation:group forKey:@"show"];
    
}

- (NSMutableArray *)numberBallArray {
    if (!_numberBallArray) {
        _numberBallArray = [[NSMutableArray alloc]init];
        
    }
    
    return _numberBallArray;
}

- (void)animationDidStart:(CAAnimation *)anim {
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    self.completion(YES);
}
@end
