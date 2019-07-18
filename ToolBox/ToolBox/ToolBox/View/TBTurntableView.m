//
//  TBTurntableView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/17.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBTurntableView.h"


//弧度转角度
#define Radians_To_Degrees(radians) ((radians) * (180.0 / M_PI))
//角度转弧度
#define Degrees_To_Radians(angle) ((angle) / 180.0 * M_PI)

@interface TBTurntableView  ()

@property (nonatomic,strong) NSMutableArray *zodiacArray;
@property (nonatomic,strong) NSMutableArray *colourArray;
@property (nonatomic,strong) CADisplayLink *disLink;
@property (nonatomic,weak) UIImageView *currentZodiacImageView;
@property (nonatomic,weak) UIImageView *currentColourBallImageView;
@property (nonatomic,weak) UIButton *startButton;

@end


@implementation TBTurntableView

- (instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    CGSize size = CGSizeMake(62, 62);
    
    UIImageView *miceImageView = [[UIImageView alloc]init];
    miceImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:miceImageView];
    [self.zodiacArray addObject:miceImageView];
    [miceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *cattleImageView = [[UIImageView alloc]init];
    cattleImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:cattleImageView];
    [self.zodiacArray addObject:cattleImageView];
    [cattleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(miceImageView);
        make.left.equalTo(miceImageView.right).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *tigerImageView = [[UIImageView alloc]init];
    tigerImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:tigerImageView];
    [self.zodiacArray addObject:tigerImageView];
    [tigerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cattleImageView);
        make.left.equalTo(cattleImageView.right).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *hareImageView = [[UIImageView alloc]init];
    hareImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:hareImageView];
    [self.zodiacArray addObject:hareImageView];
    [hareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tigerImageView);
        make.left.equalTo(tigerImageView.right).offset(5);
       make.size.equalTo(size);
    }];
    
    
    UIImageView *dragonImageView = [[UIImageView alloc]init];
    dragonImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:dragonImageView];
    [self.zodiacArray addObject:dragonImageView];
    [dragonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hareImageView.bottom).offset(5);
        make.left.equalTo(hareImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *snakeImageView = [[UIImageView alloc]init];
    snakeImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:snakeImageView];
    [self.zodiacArray addObject:snakeImageView];
    [snakeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dragonImageView.bottom).offset(5);
        make.left.equalTo(dragonImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *horseImageView = [[UIImageView alloc]init];
    horseImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:horseImageView];
    [self.zodiacArray addObject:horseImageView];
    [horseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(snakeImageView.bottom).offset(5);
        make.left.equalTo(snakeImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *sheepImageView = [[UIImageView alloc]init];
    sheepImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:sheepImageView];
    [self.zodiacArray addObject:sheepImageView];
    [sheepImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(horseImageView);
        make.right.equalTo(horseImageView.left).offset(-5);
       make.size.equalTo(size);
    }];
    
    UIImageView *monkeyImageView = [[UIImageView alloc]init];
    monkeyImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:monkeyImageView];
    [self.zodiacArray addObject:monkeyImageView];
    [monkeyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sheepImageView);
        make.right.equalTo(sheepImageView.left).offset(-5);
        make.size.equalTo(size);
    }];
    
    UIImageView *chookImageView = [[UIImageView alloc]init];
    chookImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:chookImageView];
    [self.zodiacArray addObject:chookImageView];
    [chookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monkeyImageView);
        make.right.equalTo(monkeyImageView.left).offset(-5);
       make.size.equalTo(size);
    }];
    
    UIImageView *dogImageView = [[UIImageView alloc]init];
    dogImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:dogImageView];
    [self.zodiacArray addObject:dogImageView];
    [dogImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(chookImageView.top).offset(-5);
        make.left.equalTo(chookImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *pigImageView = [[UIImageView alloc]init];
    pigImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:pigImageView];
    [self.zodiacArray addObject:pigImageView];
    [pigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(dogImageView.top).offset(-5);
        make.left.equalTo(dogImageView);
        make.size.equalTo(size);
    }];
    
    
    
    
    CGFloat R = 55;
    CGSize colourBallSize = CGSizeMake(20, 20);
    
    for (int index = 0; index < 9; index++) {
        
        CGFloat radian = Degrees_To_Radians((index + 1) * 40);
        CGFloat offset_X = cos(radian)*R;
        CGFloat offset_Y = (sin(radian)*R);
        UIImageView *colourBall = [[UIImageView alloc]init];
        colourBall.backgroundColor = [UIColor blueColor];
        colourBall.layer.cornerRadius = 10;
        colourBall.layer.masksToBounds = YES;
        [self addSubview:colourBall];
        [self.colourArray addObject:colourBall];
        [colourBall mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY).offset(offset_Y);
            make.centerX.equalTo(self.centerX).offset(offset_X);
            make.size.equalTo(colourBallSize);
        }];
    }
    
    
    
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    startButton.backgroundColor = [UIColor redColor];
    [startButton addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startButton];
    self.startButton = startButton;
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(100, 20));
    }];
    
    
}

- (void)startButtonClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
         [self startAnimation];
    }else {
        [self stopAnimation];
    }
   
}


- (void)stopAnimation {
    
    [self.disLink invalidate];
    
}
- (void)startAnimation {
    
    // 创建CADisplayLink
    self.disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkMethod)];
    self.disLink.preferredFramesPerSecond = 10;
    // 添加至RunLoop中
    [self.disLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    //    // 终止定时器
    //    [disLink invalidate];
    //    // 销毁对象
    //    disLink = nil;
   
}

- (void)linkMethod {
    
    
    [self startZodiacAnimation];
    [self startBallAnimation];
    
    
    
}

- (void)startBallAnimation {
    
    if (self.currentColourBallImageView == nil) {
        self.currentColourBallImageView = self.colourArray[0];
    }
    NSInteger  currentIndex = [self.colourArray indexOfObject:self.currentColourBallImageView];
    currentIndex++;
    if (currentIndex > 8) {
        currentIndex = 0;
    }
    self.currentColourBallImageView.layer.borderWidth = 0;
    self.currentColourBallImageView = self.colourArray[currentIndex];
    self.currentColourBallImageView.layer.borderWidth = 2;
    self.currentColourBallImageView.layer.borderColor = [UIColor orangeColor].CGColor;
}

- (void)startZodiacAnimation {
    
    if (self.currentZodiacImageView == nil) {
        self.currentZodiacImageView = self.zodiacArray[0];
    }
    NSInteger  currentIndex = [self.zodiacArray indexOfObject:self.currentZodiacImageView];
    currentIndex++;
    if (currentIndex > 11) {
        currentIndex = 0;
    }
    self.currentZodiacImageView.layer.borderWidth = 0;
    self.currentZodiacImageView = self.zodiacArray[currentIndex];
    self.currentZodiacImageView.layer.borderWidth = 2;
    self.currentZodiacImageView.layer.borderColor = [UIColor blackColor].CGColor;

    
    
}



- (NSMutableArray *)zodiacArray {
    if (!_zodiacArray) {
        _zodiacArray = [[NSMutableArray alloc]init];
    }
    return _zodiacArray;
}

- (NSMutableArray *)colourArray {
    if (!_colourArray) {
        _colourArray = [[NSMutableArray alloc]init];
    }
    return _colourArray;
}


- (void)dealloc {
    
    self.disLink = nil;
}
@end
