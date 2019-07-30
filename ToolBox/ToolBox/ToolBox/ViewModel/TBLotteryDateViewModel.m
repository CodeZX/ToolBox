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
@property (nonatomic,strong) NSCalendar *calendar;
@property (nonatomic,strong) NSDate *date;
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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextMonth) name:@"nextMonthNotification" object:nil];
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
    
    TBCalendarView *calendarView  = [[TBCalendarView alloc]initWithDataSource:[self dateModelsForDate:self.date calendar:self.calendar]];
    [self.target.view addSubview:calendarView];
    self.calendarView = calendarView;
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(10);
        make.right.equalTo(self.target.view).offset(-10);
        make.height.equalTo(calendarView.width);
    }];
    
    
    
}




// 获取Date所在月的日期模型数组
- (NSMutableArray *)dateModelsForDate:(NSDate *)date calendar:(NSCalendar *)calendar {
    
    NSDate *firstDayOfMonthDate  = [self dateForFirstDayOfMonth:date calendar:calendar];
    NSMutableArray *dateModelArray = [[NSMutableArray alloc]init];
    
    NSUInteger currentDays = [self numberDaysOfMonthForDate:firstDayOfMonthDate calendar:calendar];
    NSUInteger firstDayIndex = [self ordinalityOfWeekdayForDate:firstDayOfMonthDate calendar:calendar];
    
    for (int index = 0; index < firstDayIndex - 1; index++) {
        TBDateModel *dateModel = [[TBDateModel alloc]init];
        [dateModelArray addObject:dateModel];
    }
    for (int index = 0; index < currentDays; index++) {
        NSDate *date  = [firstDayOfMonthDate dateByAddingTimeInterval:3600 * 24 * index];
        NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
        TBDateModel *dateModel = [[TBDateModel alloc]initWithDatecomponts:dateComponents lottery:NO];
        [dateModelArray addObject:dateModel];
        
    }
    return dateModelArray;

}

- (NSMutableArray *)nextMonthModelsForDate:(NSDate *)date calendar:(NSCalendar *)calendar {
    
     NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    if (dateComponents.month == 12) {
        dateComponents.month = 0;
    }else {
       dateComponents.month = dateComponents.month + 1;
    }
    NSDate *nextMonthDate = [calendar dateFromComponents:dateComponents];
    return  [self dateModelsForDate:nextMonthDate calendar:calendar];
}

    




- (void)setupSourceData {
        
        
    
}



- (void)setupAssociate {
    
    
    
}


- (void)nextMonth {
    

    [self.calendarView reloadData:[self nextMonthModelsForDate:self.date calendar:self.calendar]];
    

}





- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (NSCalendar *)calendar {
    if (!_calendar) {
        _calendar = [NSCalendar currentCalendar];
       
    }
   return  _calendar;
}

- (NSDate *)date {
    if (!_date) {
        _date = [NSDate date];
    }
    return _date;
}


@end



@implementation TBLotteryDateViewModel (TBCalendar)

// 当月的天数
- (NSInteger)numberDaysOfMonthForDate:(NSDate *)date calendar:(NSCalendar *)calendar {
   
    // 获取当月天数
    NSRange DaysRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return DaysRange.length;
}

// 当月的第一个工作日星期序号
- (NSInteger)ordinalityOfWeekdayForDate:(NSDate *)date calendar:(NSCalendar *)calendar {
    
    // 序号范围 1 ~ 7   1->周天 2->周一 ....  7->周六
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    dateComponents.day = 1;
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:dateComponents];
    NSDateComponents *firstDayOfMonthComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:firstDayOfMonthDate];
    return firstDayOfMonthComponents.weekday;
}



// 当月的第一个工作日的 date对象
- (NSDate *)dateForFirstDayOfMonth:(NSDate *)date calendar:(NSCalendar *)calendar {
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    dateComponents.day = 1;
    //    NSLog(@"%@",dateComponents);
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:dateComponents];
    return firstDayOfMonthDate;
}




+ (NSString *)stringForCurrentDate {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger timeInterval = [zone secondsFromGMTForDate:[NSDate date]];
    NSDate *currentDate = [[NSDate date] dateByAddingTimeInterval:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @" YYYY-MM ";
    return [formatter stringFromDate:currentDate];
    
}


+ (NSString *)stringForChinadDate {
    
    return [TBLotteryDateViewModel stringForChinadDate:[NSDate date]];
}

+ (NSString *)stringForChinadDate:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    NSArray *chinaYears = @[  @"甲子",@"乙丑",@"丙寅",@"丁卯",@"戊辰 ",@"己巳",@"庚午",@"辛未",@"壬申",@"癸酉",
                            @"甲戌",@"乙亥",@"丙子",@"丁丑",@"戊寅 ",@"己卯",@"庚辰",@"辛巳",@"壬午",@"癸未",
                            @"甲申",@"乙酉",@"丙戌",@"丁亥",@"戊子 ",@"己丑",@"庚寅",@"辛卯",@"壬辰",@"癸巳",
                            @"甲午",@"乙未",@"丙申",@"丁酉",@"戊戌 ",@"己亥",@"庚子",@"辛丑",@"壬寅",@"癸卯",
                            @"甲辰",@"乙卯",@"丙辰",@"丁巳",@"戊午 ",@"己未",@"庚申",@"辛酉",@"壬戌",@"癸亥",
                            ];
    NSArray *chineseMonths = [NSArray arrayWithObjects:@"正月", @"二月", @"三月", @"四月", @"五月", @"六月",
                            @"七月", @"八月",@"九月", @"十月", @"冬月", @"腊月", nil];
    NSArray *chineseDays = [NSArray arrayWithObjects:@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七",
                          @"初八", @"初九", @"初十",@"十一", @"十二", @"十三", @"十四",
                          @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",@"廿一",
                          @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八",
                          @"廿九", @"三十", nil];
    
    return [NSString stringWithFormat:@"%@年%@%@", chinaYears[components.year - 1], chineseMonths[components.month - 1], chineseDays[components.day - 1]];
}
@end



