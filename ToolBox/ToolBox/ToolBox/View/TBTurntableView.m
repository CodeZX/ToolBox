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
@property (nonatomic,strong) NSMutableArray *randomZodiacArray;
@property (nonatomic,strong) NSMutableArray *colorArray;
@property (nonatomic,strong) NSMutableArray *randomColorArray;
@property (nonatomic,strong) CADisplayLink *disLink;
@property (nonatomic,weak) UIImageView *currentZodiacImageView;
@property (nonatomic,weak) UIImageView *currentColorBallImageView;
@property (nonatomic,weak) UIButton *startButton;
@property (nonatomic,weak) UILabel *resultLabel;

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
    
    UIImageView *miceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_mouse"] highlightedImage:[UIImage imageNamed:@"ico_mouse_press"]];
    miceImageView.layer.cornerRadius = 5;
    miceImageView.layer.masksToBounds = YES;
//    miceImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:miceImageView];
    [self.zodiacArray addObject:miceImageView];
    [miceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *cattleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_cow"] highlightedImage:[UIImage imageNamed:@"ico_cow_press"]];
    cattleImageView.layer.cornerRadius = 5;
    cattleImageView.layer.masksToBounds = YES;
//    cattleImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:cattleImageView];
    [self.zodiacArray addObject:cattleImageView];
    [cattleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(miceImageView);
        make.left.equalTo(miceImageView.right).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *tigerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_tiger"] highlightedImage:[UIImage imageNamed:@"ico_tiger_press"]];
    tigerImageView.layer.cornerRadius = 5;
    tigerImageView.layer.masksToBounds = YES;
//    tigerImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:tigerImageView];
    [self.zodiacArray addObject:tigerImageView];
    [tigerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cattleImageView);
        make.left.equalTo(cattleImageView.right).offset(5);
        make.size.equalTo(size);
    }];
    
    
    UIImageView *hareImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_rabbit"] highlightedImage:[UIImage imageNamed:@"ico_rabbit_press"]];
    hareImageView.layer.cornerRadius = 5;
    hareImageView.layer.masksToBounds = YES;
//    hareImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:hareImageView];
    [self.zodiacArray addObject:hareImageView];
    [hareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tigerImageView);
        make.left.equalTo(tigerImageView.right).offset(5);
       make.size.equalTo(size);
    }];
    
    
    UIImageView *dragonImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_dragon"] highlightedImage:[UIImage imageNamed:@"ico_dragon_press"]];
    dragonImageView.layer.cornerRadius = 5;
    dragonImageView.layer.masksToBounds = YES;
//    dragonImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:dragonImageView];
    [self.zodiacArray addObject:dragonImageView];
    [dragonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hareImageView.bottom).offset(5);
        make.left.equalTo(hareImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *snakeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_snake"] highlightedImage:[UIImage imageNamed:@"ico_snake_press"]];
    snakeImageView.layer.cornerRadius = 5;
    snakeImageView.layer.masksToBounds = YES;
//    snakeImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:snakeImageView];
    [self.zodiacArray addObject:snakeImageView];
    [snakeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dragonImageView.bottom).offset(5);
        make.left.equalTo(dragonImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *horseImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_horse"] highlightedImage:[UIImage imageNamed:@"ico_horse_press"]];
    horseImageView.layer.cornerRadius = 5;
    horseImageView.layer.masksToBounds = YES;
//    horseImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:horseImageView];
    [self.zodiacArray addObject:horseImageView];
    [horseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(snakeImageView.bottom).offset(5);
        make.left.equalTo(snakeImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *sheepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_sheep"] highlightedImage:[UIImage imageNamed:@"ico_sheep_press"]];
    sheepImageView.layer.cornerRadius = 5;
    sheepImageView.layer.masksToBounds = YES;
//    sheepImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:sheepImageView];
    [self.zodiacArray addObject:sheepImageView];
    [sheepImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(horseImageView);
        make.right.equalTo(horseImageView.left).offset(-5);
       make.size.equalTo(size);
    }];
    
    UIImageView *monkeyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_monkey"] highlightedImage:[UIImage imageNamed:@"ico_monkey_press"]];
    monkeyImageView.layer.cornerRadius = 5;
    monkeyImageView.layer.masksToBounds = YES;
//    monkeyImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:monkeyImageView];
    [self.zodiacArray addObject:monkeyImageView];
    [monkeyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sheepImageView);
        make.right.equalTo(sheepImageView.left).offset(-5);
        make.size.equalTo(size);
    }];
    
    UIImageView *chookImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_chicken"] highlightedImage:[UIImage imageNamed:@"ico_chicken_press"]];
    chookImageView.layer.cornerRadius = 5;
    chookImageView.layer.masksToBounds = YES;
//    chookImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:chookImageView];
    [self.zodiacArray addObject:chookImageView];
    [chookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(monkeyImageView);
        make.right.equalTo(monkeyImageView.left).offset(-5);
       make.size.equalTo(size);
    }];
    
    UIImageView *dogImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_dog"] highlightedImage:[UIImage imageNamed:@"ico_dog_press"]];
    dogImageView.layer.cornerRadius = 5;
    dogImageView.layer.masksToBounds = YES;
//    dogImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:dogImageView];
    [self.zodiacArray addObject:dogImageView];
    [dogImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(chookImageView.top).offset(-5);
        make.left.equalTo(chookImageView);
        make.size.equalTo(size);
    }];
    
    UIImageView *pigImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_pig"] highlightedImage:[UIImage imageNamed:@"ico_pig_press"]];
    pigImageView.layer.cornerRadius = 5;
    pigImageView.layer.masksToBounds = YES;
//    pigImageView.backgroundColor  = [UIColor redColor];
    [self addSubview:pigImageView];
    [self.zodiacArray addObject:pigImageView];
    [pigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(dogImageView.top).offset(-5);
        make.left.equalTo(dogImageView);
        make.size.equalTo(size);
    }];
    
    
    
    
    CGFloat R = 55;
    CGSize colourBallSize = CGSizeMake(30, 30);
    
    for (int index = 0; index < 9; index++) {
        
        CGFloat radian = Degrees_To_Radians((index + 1) * 40);
        CGFloat offset_X = cos(radian)*R;
        CGFloat offset_Y = (sin(radian)*R);
        NSString *imageName;
        NSString *highlightedName;
        switch (index % 3) {
            case 0:
                imageName = @"green_wave";
                highlightedName = @"green_wave_press";
                break;
                
            case 1:
                imageName = @"blue_wave";
                highlightedName = @"blue_wave_press";
                break;
            case 2:
                imageName = @"red_wave";
                highlightedName = @"red_wave_press";
                break;
            default:
                break;
        }
        UIImageView *colourBall = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:highlightedName]];
//        colourBall.backgroundColor = [UIColor blueColor];
        colourBall.layer.cornerRadius = 10;
        colourBall.layer.masksToBounds = YES;
        [self addSubview:colourBall];
        [self.colorArray addObject:colourBall];
        [colourBall mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerY).offset(offset_Y);
            make.centerX.equalTo(self.centerX).offset(offset_X);
            make.size.equalTo(colourBallSize);
        }];
    }
    
    
    UILabel *resultLabel = [[UILabel alloc]init];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.textColor = [UIColor orangeColor];
//    resultLabel.backgroundColor = [UIColor redColor];
    resultLabel.alpha = 0;
    resultLabel.font = [UIFont systemFontOfSize:14];
    resultLabel.numberOfLines  = 0;
    [self addSubview:resultLabel];
    self.resultLabel = resultLabel;
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(80, 100));
    }];
    
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageNamed:@"btn_start.9"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"btn_start_press.9"] forState:UIControlStateSelected];
//    [startButton setTitle:@"开始" forState:UIControlStateNormal];
//    startButton.backgroundColor = [UIColor redColor];
    [startButton addTarget:self action:@selector(startButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startButton];
    self.startButton = startButton;
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(70, 30));
    }];
    
    
    
}

- (void)startButtonClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.userInteractionEnabled = NO;
         [self startAnimation];
    }
   
}


- (void)stopAnimation {
    
    [self.disLink invalidate];
    self.disLink = nil;
    
}
- (void)startAnimation {
    
    // 创建CADisplayLink
    self.disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startZodiacAndBallAnimation)];
    self.disLink.preferredFramesPerSecond = 10;
    // 添加至RunLoop中
    [self.disLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    //    // 终止定时器
    //    [disLink invalidate];
    //    // 销毁对象
    //    disLink = nil;
   
}

- (void)startZodiacAndBallAnimation {
    
    [self startBallAnimation];
    [self startZodiacAnimation];
    
    
}

- (void)startBallAnimation {
    
    if (self.currentColorBallImageView == nil) {
        self.currentColorBallImageView = [self.colorArray firstObject];
    }
    NSInteger  currentIndex = [self.colorArray indexOfObject:self.currentColorBallImageView];
    currentIndex++;
    if (currentIndex > self.colorArray.count - 1) {
        currentIndex = 0;
    }

    self.currentColorBallImageView.highlighted = NO;
    self.currentColorBallImageView = self.colorArray[currentIndex];
    self.currentColorBallImageView.highlighted = YES;
    
}

- (void)startZodiacAnimation {
    
    if (self.currentZodiacImageView == nil) {
        self.currentZodiacImageView = [self.zodiacArray firstObject];
    }
    NSInteger  currentIndex = [self.zodiacArray indexOfObject:self.currentZodiacImageView];
    currentIndex++;
    if ((currentIndex > self.zodiacArray.count - 1) ) {
        currentIndex = 0;
        int random = rand() % self.zodiacArray.count ;
        UIImageView *randomImageView = self.zodiacArray[random];
        randomImageView.highlighted = YES;
        randomImageView.tag = random;
        [self.randomZodiacArray addObject:randomImageView];
        if (self.randomZodiacArray.count == 3) {
            [self stopAnimation];
        }
    }
    
    if (self.currentZodiacImageView.tag == 0) {
        self.currentZodiacImageView.highlighted = NO;
    }
    self.currentZodiacImageView = self.zodiacArray[currentIndex];
    self.currentZodiacImageView.highlighted = YES;

    
    if (!self.disLink) {
        self.currentZodiacImageView.highlighted = NO;
        [self showTurntableResult];
    }
}

-  (void)showTurntableResult {
    
    NSArray *zodiacs = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
    NSArray *colors = @[@"绿波",@"蓝波",@"红波",@"绿波",@"蓝波",@"红波",@"绿波",@"蓝波",@"红波"];
    __block NSString *zodiac = @"";
    [self.randomZodiacArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        zodiac =  [zodiac stringByAppendingString:[NSString stringWithFormat:@"%@  ",zodiacs[idx]]];
    }];
    [self.colorArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = (UIImageView *)obj;
        imageView.highlighted = NO;
    }];
    NSInteger colorIndex = rand() % self.colorArray.count;
    self.currentColorBallImageView = self.colorArray[colorIndex];
    self.currentColorBallImageView.highlighted = YES;
    
    zodiac = [zodiac stringByAppendingString:[NSString stringWithFormat:@"\n %@",colors[colorIndex]]];
    self.startButton.alpha = 0;
    self.resultLabel.text = zodiac;
    self.resultLabel.alpha = 1;
    
    
    
}



- (NSMutableArray *)zodiacArray {
    if (!_zodiacArray) {
        _zodiacArray = [[NSMutableArray alloc]init];
    }
    return _zodiacArray;
}

- (NSMutableArray *)randomZodiacArray {
    if (!_randomZodiacArray) {
        _randomZodiacArray = [[NSMutableArray alloc]init];
    }
   return  _randomZodiacArray;
}



- (NSMutableArray *)colorArray {
    if (!_colorArray) {
        _colorArray = [[NSMutableArray alloc]init];
    }
    return _colorArray;
}

- (NSMutableArray *)randomColorArray {
    if (!_randomColorArray) {
        _randomColorArray = [[NSMutableArray alloc]init];
    }
    return _randomColorArray;
}



- (void)dealloc {
    
    self.disLink = nil;
}
@end
