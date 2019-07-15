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


@interface TBLotteryViewModel  ()
@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) UIImageView *buntingImageView;
@property (nonatomic,weak) UIImageView *dollImageView;
@property (nonatomic,weak) UIImageView *turntableImageView;
@property (nonatomic,weak) UIButton *startLotteryButton;
@property (nonatomic,weak) TBLuckNumberView *luckNumberView;




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
    
    UIImageView *buntingImageView = [[UIImageView alloc]init];
    buntingImageView.backgroundColor = [UIColor yellowColor];
    [self.target.view addSubview:buntingImageView];
    self.buntingImageView =buntingImageView;
    [self.buntingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.target.view.top).offset(64);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(40);
    }];
    
    
    UIImageView *turntableImageView = [[UIImageView alloc]init];
    turntableImageView.backgroundColor = [UIColor yellowColor];
    [self.target.view addSubview:turntableImageView];
    self.turntableImageView = turntableImageView;
    [self.turntableImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view.centerY).offset(-20);
        make.centerX.equalTo(self.target.view);
        make.size.equalTo(CGSizeMake(100, 100));
    }];
    
    
    
    UIImageView *dollImageView = [[UIImageView alloc]init];
    dollImageView.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:dollImageView];
    self.dollImageView = dollImageView;
    [self.dollImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(turntableImageView);
        make.right.equalTo(turntableImageView.left).offset(-10);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    
    UIButton *startLotteryButton = [[UIButton alloc]init];
    startLotteryButton.backgroundColor = [UIColor yellowColor];
    [startLotteryButton addTarget:self action:@selector(lotteryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:startLotteryButton];
    self.startLotteryButton = startLotteryButton;
    [self.startLotteryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(turntableImageView);
        make.left.equalTo(turntableImageView.right).offset(10);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    
    
    TBLuckNumberView *luckNumberView = [[TBLuckNumberView alloc]init];
    [self.target.view addSubview:luckNumberView];
    self.luckNumberView = luckNumberView;
    [self.luckNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.target.view.centerY).offset(10);
        make.centerX.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(10);
        make.right.equalTo(self.target.view).offset(-10);
        make.height.equalTo(200);
    }];
    
    
    
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.font = [UIFont systemFontOfSize:11];
    promptLabel.text = @"小提示：幸运摇奖只用于模拟开奖，点击摇杆，系统将自动的摇出一组幸运号码。";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
   
}

- (void)setupSourceData {
    
}
    
    
- (void)setupAssociate {
    

    
    
}

- (void)lotteryButtonClick:(UIButton *)sender {
    
    [self.luckNumberView startLottery:^(BOOL finished) {
        
    }];
}
        
            
    
    
@end
