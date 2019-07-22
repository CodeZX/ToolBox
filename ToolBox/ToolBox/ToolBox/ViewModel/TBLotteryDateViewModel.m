//
//  TBLotteryDateViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLotteryDateViewModel.h"
#import "TBBriefIntroductionView.h"
#import "TBCalendarView.h"


@interface TBLotteryDateViewModel ()

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) TBCalendarView *calendarView;
@end

@implementation TBLotteryDateViewModel
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
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"搅珠日期对照表，可查看当月及下一个月的的搅珠开奖日期。"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    TBCalendarView *calendarView  = [[TBCalendarView alloc]init];
    [self.target.view addSubview:calendarView];
    self.calendarView = calendarView;
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(10);
        make.right.equalTo(self.target.view).offset(-10);
        make.height.equalTo(calendarView.width);
    }];
    
}

- (void)setupSourceData {
    
    
}

- (void)setupAssociate {
    
  
}



@end
