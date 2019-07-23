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
#import "TBDateModel.h"

@interface TBLotteryDateViewModel ()

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) TBCalendarView *calendarView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation TBLotteryDateViewModel
- (instancetype)initWithTarget:(UIViewController *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupSourceData];
        [self setupComponent];
        
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
    
    TBCalendarView *calendarView  = [[TBCalendarView alloc]initWithDataSource:self.dataSource];
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
    
    
     NSCalendar *calendar = [NSCalendar currentCalendar];
     // 获取当月天数
     NSRange currentDaysRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger currentDays = currentDaysRange.length;
    // 获取当月一号的开始索引 （7 1 2 3 4 5 6）
    NSUInteger firstDayIndex = [calendar firstWeekday];
    for (int index = 0; index < firstDayIndex; index++) {
        TBDateModel *dateModel = [[TBDateModel alloc]init];
        [self.dataSource addObject:dateModel];
    }
    // 遍历当月日期组件 生成日期模型
    
    for (int insdex = 0; insdex < currentDays; insdex++) {
        
        NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:[NSDate date]];
        dateComponents.day = insdex + 1;
        dateComponents.hour = 0;
        dateComponents.minute = 0;
        dateComponents.second = 0;
        TBDateModel *dateModel = [[TBDateModel alloc]initWithDatecomponts:dateComponents lottery:NO];
        NSLog(@"%@",dateModel);
        [self.dataSource addObject:dateModel];
        
    }
    
    
    // 刷新collectionView
    
//    [self getFirstDayWeekForMonth:[NSDate date]];
    
}

- (void)setupAssociate {
    
  
}




-(NSInteger)getCurrentMonthForDays{
    // 创建一个日期类对象(当前月的calendar对象)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSRange是一个结构体，其中location是一个以0为开始的index，length是表示对象的长度。他们都是NSUInteger类型。
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}


-(NSInteger)getFirstDayWeekForMonth:(NSDate*)date
{
    // NSCalendarIdentifierGregorian : 指定日历的算法
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
    // 调用NSCalendar的components:fromDate:方法返回一个NSDateComponents对象
    // 需要的参数分别components:所需要的日期单位 date:目标月份的date对象
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    
    
    NSLog(@"NSDateComponents是这个样子的:%@",comps);
    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];

    weekday--;
    NSLog(@"[comps weekday] = %ld",(long)weekday);
    if (weekday == 7) {
        return 0;
    }else return weekday;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

@end
