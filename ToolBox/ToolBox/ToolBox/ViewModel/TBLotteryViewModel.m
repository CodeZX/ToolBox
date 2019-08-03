//
//  TBLotteryViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/15.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLotteryViewModel.h"
#import "TBBriefIntroductionView.h"
#import "TBLuckNumberView.h"
#import <AudioToolbox/AudioToolbox.h>


@interface TBLotteryViewModel  ()
@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) UIImageView *backgroudImageView;
@property (nonatomic,weak) UIImageView *buntingImageView;
@property (nonatomic,weak) UIImageView *dollImageView;
@property (nonatomic,weak) UIImageView *turntableImageView;
@property (nonatomic,weak) UIButton *startLotteryButton;
@property (nonatomic,weak) TBLuckNumberView *luckNumberView;
@property (nonatomic, strong) dispatch_source_t timer;





@property (nonatomic,weak) UILabel *promptLabel;

@end

@implementation TBLotteryViewModel


- (instancetype)initWithTarget:(UIViewController *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupComponent];
        [self setupSourceData];
        [self setupAssociate];
    }
    return self;
    
}

- (void)setupTarget:(UIViewController *)target {
    
    if (target) {
        self.target = target;
    }
    
}

- (void)setupComponent {
    
    
    
    
    UIImageView *buntingImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_tool_lucky_top"]];
//    buntingImageView.backgroundColor = [UIColor yellowColor];
    [self.target.view addSubview:buntingImageView];
    self.buntingImageView =buntingImageView;
    [self.buntingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.target.view.top).offset(88);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(40);
    }];
    
    UIImageView *backgroudImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_tool_lucky_6"]];
    NSArray *imags = @[[UIImage imageNamed:@"bg_tool_lucky_1"],
                       [UIImage imageNamed:@"bg_tool_lucky_2"],
                       [UIImage imageNamed:@"bg_tool_lucky_3"],
                       [UIImage imageNamed:@"bg_tool_lucky_4"],
                       [UIImage imageNamed:@"bg_tool_lucky_5"],
                       [UIImage imageNamed:@"bg_tool_lucky_6"],
                       ];
    [backgroudImageView setAnimationImages:imags];
    backgroudImageView.animationDuration = 1.5;
    backgroudImageView.animationRepeatCount = 1;
    backgroudImageView.alpha = 0;
//    backgroudImageView.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:backgroudImageView];
    self.backgroudImageView = backgroudImageView;
    [self.backgroudImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view).offset(-100);
        make.left.equalTo(self.target.view).offset(10);
        make.right.equalTo(self.target.view).offset(-10);
        make.height.equalTo(200);
    }];
   
    
    
    UIImageView *turntableImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_lucky_trun"]];
//    turntableImageView.backgroundColor = [UIColor yellowColor];
    [self.target.view addSubview:turntableImageView];
    self.turntableImageView = turntableImageView;
    [self.turntableImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view.centerY).offset(-50);
        make.centerX.equalTo(self.target.view);
        make.size.equalTo(CGSizeMake(120, 120));
    }];
    
    
    UIImageView *turntableCenterImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_lucky_yaohao"]];
    [self.target.view addSubview:turntableCenterImageView];
    [turntableCenterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(turntableImageView);
        make.size.equalTo(turntableImageView);
    }];
    
    
    UIImageView *dollImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_lucky_man_nomal"]];
    NSArray *dollImages = @[[UIImage imageNamed:@"icon_tool_lucky_man_nomal"],[UIImage imageNamed:@"icon_tool_lucky_man_turning"]];
    [dollImageView setAnimationImages:dollImages];
    dollImageView.animationRepeatCount = 10;
    dollImageView.animationDuration = .3;
//    dollImageView.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:dollImageView];
    self.dollImageView = dollImageView;
    [self.dollImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(turntableImageView);
        make.right.equalTo(turntableImageView.left).offset(-10);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    
    UIButton *startLotteryButton = [[UIButton alloc]init];
    [startLotteryButton setImage:[UIImage imageNamed:@"btn_tool_lucky_yaohao"] forState:UIControlStateNormal];
    [startLotteryButton setImage:[UIImage imageNamed:@"btn_tool_lucky_yaohao_press"] forState:UIControlStateSelected];
    [startLotteryButton addTarget:self action:@selector(lotteryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:startLotteryButton];
    self.startLotteryButton = startLotteryButton;
    [self.startLotteryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(turntableImageView);
        make.left.equalTo(turntableImageView.right).offset(30);
        make.size.equalTo(CGSizeMake(25, 60));
    }];
    
    
    TBLuckNumberView *luckNumberView = [[TBLuckNumberView alloc]init];
    [self.target.view addSubview:luckNumberView];
    self.luckNumberView = luckNumberView;
    [self.luckNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.target.view.centerY).offset(10);
        make.centerX.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(10);
        make.right.equalTo(self.target.view).offset(-10);
        make.height.equalTo(120);
    }];
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.numberOfLines = 0;
    promptLabel.font = [UIFont systemFontOfSize:11];
    promptLabel.textColor = [UIColor orangeColor];
    promptLabel.text = @"幸运摇奖只用于模拟开奖，点击摇杆，系统将自动的摇出一组幸运号码。";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(20);
        make.right.equalTo(-20);
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
   
}

- (void)setupSourceData {
    
}
    
    
- (void)setupAssociate {
    

    
    
}

- (void)lotteryButtonClick:(UIButton *)sender  {
    
    self.startLotteryButton.selected = !sender.selected;
    
    if (self.startLotteryButton.selected) {
        self.startLotteryButton.userInteractionEnabled = NO;
        [self startAnimation];
       
    }
    
    
}


- (void)playAudioFromFile:(NSString *)fileName {
    
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:fileName ofType:@"wav"];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl:音频文件url
     * outSystemSoundID:声音id（此函数会将音效文件加入到系统音频服务中并返回一个长整形ID）
     */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
    //    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
    AudioServicesPlaySystemSound(soundID);//播放音效
    //    AudioServicesPlayAlertSound(soundID);//播放音效并震动
    //3.销毁声音
    //    AudioServicesDisposeSystemSoundID(soundID);
}
- (void)startAnimation {
    
    
    [self playAudioFromFile:@"yao"];
    self.backgroudImageView.alpha = 0;
    [self startTurntableAnimation];
    [self startDollAnimation];
    __weak typeof(self) weakSelf = self;
    [self.luckNumberView startLottery:^(BOOL finished) {
        if (finished) {
            [weakSelf stopAnimation];
        }
    }];
    
    
}


- (void)stopAnimation {
    
//    NSLog(@"stop");
    if (self.startLotteryButton.selected) {
        self.startLotteryButton.userInteractionEnabled = YES;
        self.startLotteryButton.selected = NO;
        self.turntableImageView.image =  [UIImage imageNamed:@"icon_tool_lucky_trun"];
        [self stopTurntableAnimation];
        [self stopDollAnimation];
        [self.backgroudImageView startAnimating];
        self.backgroudImageView.alpha = 1;
    }
   
   
}


- (void)startTurntableAnimation {
    
    self.turntableImageView.image =  [UIImage imageNamed:@"icon_tool_lucky_truning"];
    CABasicAnimation *rotationAnimation = [[CABasicAnimation alloc]init];
    rotationAnimation.keyPath = @"transform.rotation";
    rotationAnimation.fromValue = @(0);
    rotationAnimation.toValue = @(M_PI * 2);
    rotationAnimation.duration = .8;
    rotationAnimation.repeatCount = MAXLOGNAME;
    [self.turntableImageView.layer addAnimation:rotationAnimation forKey:@"rotation"];
}


        
            
-(void)startDollAnimation {
    
    [self.dollImageView startAnimating];
//    __block NSString *str =@"image_huoyan_2";
////    backImage.image = [UIImage imageNamed:str];
//    //定时器开始执行的延时时间
//    NSTimeInterval delayTime = 0.0f;
//    //定时器间隔时间
//    NSTimeInterval timeInterval = 0.1f;
//    //创建子线程队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //使用之前创建的队列来创建计时器
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    //设置延时执行时间，delayTime为要延时的秒数
//    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
//    //设置计时器
//    dispatch_source_set_timer(_timer, startDelayTime, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(_timer, ^{
//        //执行事件
//        if ( [str isEqualToString:@"image_huoyan_1"]) {
//            str = @"image_huoyan_2";
//        } else {
//            str = @"image_huoyan_1";
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
////            [backImage setImage:[UIImage imageNamed:str]];
//            if ([str isEqualToString:@"image_huoyan_2"]) {
//                self.dollImageView.backgroundColor = [UIColor redColor];
//            }else {
//                self.dollImageView.backgroundColor = [UIColor yellowColor];
//            }
//        }) ;
//    });
//    // 启动计时器
//    dispatch_resume(_timer);
}

//停止动画
-(void)stopDollAnimation  {
//    dispatch_source_cancel(_timer);
}

- (void)stopTurntableAnimation {
    

    [self.turntableImageView.layer removeAllAnimations];
}
@end
