//
//  TBTurntableViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/17.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBTurntableViewModel.h"
#import "TBBriefIntroductionView.h"
#import "TBTurntableView.h"

@interface TBTurntableViewModel ()
@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) TBTurntableView *turntableView;
@property (nonatomic,weak) UILabel *promptLabel;
@end
@implementation TBTurntableViewModel

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
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"转转转！转出本期的生肖和波色，激动不如行动，赶紧来v转出您心目中的生肖和波色！"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    
    TBTurntableView *turntableView = [[TBTurntableView alloc]init];
    [self.target.view addSubview:turntableView];
    self.turntableView = turntableView;
    [self.turntableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(50);
        make.right.equalTo(self.target.view).offset(-50);
        make.height.equalTo(turntableView.width);
    }];
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"小提示：每期只能进行一次波肖转盘！";
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


- (void)startAnimation {
    
    [self.turntableView startAnimation];
}
@end
