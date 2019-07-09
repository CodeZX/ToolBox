//
//  TBShakeViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/8.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBShakeViewModel.h"
#import "TBBriefIntroductionView.h"
#import "TBShakeView.h"
@interface TBShakeViewModel ()

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) TBShakeView *shakeView;
@property (nonatomic,weak) UILabel *promptLabel;
@end
@implementation TBShakeViewModel

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
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"试试你的手气有多准！只要摇一摇！就能算出专属您的比期特码！"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    TBShakeView *shakeView = [[TBShakeView alloc]init];
    [self.target.view addSubview:shakeView];
    self.shakeView = shakeView;
    [self.shakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.size.equalTo(CGSizeMake(200, 200));
    }];
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"小提示：每期只能进行一次幸运翻盘！";
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

- (void)startShake {
    
    [self.shakeView startSharke];
}
@end
