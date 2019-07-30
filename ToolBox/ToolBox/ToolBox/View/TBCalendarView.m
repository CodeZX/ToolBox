//
//  TBCalendarView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBCalendarView.h"
#import "TBCalendarViewCell.h"
#import "TBLotteryDateViewModel.h"

@interface TBCalendarView   ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;
@end

static NSString * const cellIdentifier = @"cellCcalendarViewcell";
static NSString * const headerIdentifier = @"headerCalendarViewcell";
static NSString * const footIdentifier = @"footCalendarViewcell";
@implementation TBCalendarView


- (instancetype)initWithDataSource:(NSArray *)dataSource {
    self = [super init];
    if (self) {
        self.dataSource = dataSource;
    }
    return self;
    
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}



- (void)reloadData:(NSArray *)dataSource {
    
    self.dataSource = dataSource;
    [self.collectionView reloadData];
}

- (void)setupUI {
    
   
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(100, 100);
    layout.footerReferenceSize = CGSizeMake(100, 44);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing =  0;
//    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3.0, [UIScreen mainScreen].bounds.size.width/3.0);
    layout.itemSize = CGSizeMake(50, 50);
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20,[UIScreen mainScreen].bounds.size.height);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[TBCalendarViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [collectionView registerClass:[TBCalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [collectionView registerClass:[TBCalendarFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIdentifier];

    
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TBCalendarViewCell *cell = [TBCalendarViewCell cellWithCollectionView:collectionView Identifier:cellIdentifier forIndexPath:indexPath];
    cell.dateModel = self.dataSource[indexPath.row];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        TBCalendarHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor redColor];
    
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        TBCalendarFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIdentifier forIndexPath:indexPath];
        footView.backgroundColor = [UIColor redColor];
        return footView;
    }
    
    return nil;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TBDateModel *model = self.dataSource[indexPath.row];
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDate *date = [currentCalendar dateFromComponents:model.dateComponents];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"KSelectDateNotification" object:self userInfo:@{@"date":date}];
}





@end

@interface TBCalendarHeaderView ()

@property (nonatomic,weak) UILabel *dateLabel;
@property (nonatomic,weak) UIButton *nextButton;
@property (nonatomic,weak) UIButton *backButton;
@property (nonatomic,weak) UIView *weekDayView;

@end

@implementation TBCalendarHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    
    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.backgroundColor = [UIColor blueColor];
    dateLabel.text = [TBLotteryDateViewModel stringForCurrentDate];
    [self addSubview:dateLabel];
    self.dateLabel  = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self).offset(-50);
    }];
    
    
    UIButton *backButton = [[UIButton alloc]init];
    [backButton setTitle:@"<<" forState:UIControlStateNormal];
    [self addSubview:backButton];
    self.backButton = backButton;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.height.equalTo(dateLabel);
        make.width.equalTo(100);
    }];

    UIButton *nextButton = [[UIButton alloc]init];
    [nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@">>" forState:UIControlStateNormal];
    [self addSubview:nextButton];
    self.nextButton = nextButton;
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.height.equalTo(dateLabel);
        make.width.equalTo(100);
    }];
    
    UIView *weekDayView = [[UIView alloc]init];
    weekDayView.backgroundColor = [UIColor whiteColor];
    [self addSubview:weekDayView];
    self.weekDayView = weekDayView;
    [self.weekDayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.dateLabel.bottom);
    }];
    
    UILabel *lastWeekDayLabel = nil;
    for (int index = 0; index < 7; index++) {
        
        UILabel *weekDayLabel = [[UILabel alloc]init];
        weekDayLabel.textAlignment = NSTextAlignmentCenter;
        weekDayLabel.text = [NSString stringWithFormat:@"%d",index];
        [self.weekDayView addSubview:weekDayLabel];
        if (index == 0) {
            [weekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.weekDayView);
                make.top.bottom.equalTo(weekDayView);
                make.width.equalTo(self.weekDayView).multipliedBy(1/7.0);
            }];
        } else {
            [weekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastWeekDayLabel.right);
                make.top.bottom.equalTo(weekDayView);
                make.width.equalTo(self.weekDayView).multipliedBy(1/7.0);
            }];
        }
       
        lastWeekDayLabel = weekDayLabel;
    }
    
   
    
    
}


- (void)nextButtonClicked:(UIButton *)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nextMonthNotification" object:nil];
    
}
@end



@interface TBCalendarFootView ()

@property (nonatomic,weak) UILabel *dateLabel;
@end

@implementation TBCalendarFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChange:) name:@"KSelectDateNotification" object:nil];
    }
    return self;
}


- (void)setupUI {
    
    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.text = [TBLotteryDateViewModel stringForChinadDate];
    [self addSubview:dateLabel];
    self.dateLabel = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    
}
- (void)dateChange:(NSNotification *)notification {
    
    NSDictionary *userInfo  = notification.userInfo;
    self.dateLabel.text = [TBLotteryDateViewModel stringForChinadDate:[userInfo objectForKey:@"date"]];
}
@end
