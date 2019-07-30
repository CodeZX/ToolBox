//
//  TBLotteryDateViewModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBLotteryDateViewModel : NSObject

- (instancetype)initWithTarget:(UIViewController *)target;


@end



@interface TBLotteryDateViewModel (TBCalendar)

// 当月的天数
- (NSInteger)numberDaysOfMonthForDate:(NSDate *)date calendar:(NSCalendar *)calendar;
// 当月的第一个工作日星期序号
- (NSInteger)ordinalityOfWeekdayForDate:(NSDate *)date calendar:(NSCalendar *)calendar;
// 当月的第一个工作日的 date对象
- (NSDate *)dateForFirstDayOfMonth:(NSDate *)date calendar:(NSCalendar *)calendar;
// 当前日期
+ (NSString *)stringForCurrentDate;
// 当前农历
+ (NSString *)stringForChinadDate;

// date的农历日期
+ (NSString *)stringForChinadDate:(NSDate *)date;
@end



NS_ASSUME_NONNULL_END
