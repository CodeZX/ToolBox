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
    layout.headerReferenceSize = CGSizeMake(0, 100);
    layout.footerReferenceSize = CGSizeMake(0, 44);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing =  1;
//    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3.0, [UIScreen mainScreen].bounds.size.width/3.0);
    CGFloat W = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat H = [UIScreen mainScreen].bounds.size.width + 50;
    layout.itemSize = CGSizeMake((W - 6) / 7, (W - 6) / 7);
    CGRect frame = CGRectMake(0, 0,W ,H);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
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
    
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        TBCalendarFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footIdentifier forIndexPath:indexPath];
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

@property (nonatomic,weak) UIImageView *backgroudImageView;
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
    
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_calendar_top_centre.9"]];
    [self addSubview:backgroundImageView];
    self.backgroudImageView = backgroundImageView;
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(self).multipliedBy(0.5);
    }];
    
    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.textColor = [UIColor whiteColor];
//    dateLabel.backgroundColor = [UIColor whiteColor];
    dateLabel.text = [TBLotteryDateViewModel stringForCurrentDate];
    [self addSubview:dateLabel];
    self.dateLabel  = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self).offset(-50);
    }];
    
    
    UIButton *backButton = [[UIButton alloc]init];
    UIImage *backBackgroundImage = [UIImage imageNamed:@"bg_calendar_top_left.9"];
    UIImage *backtretchableBackgroundImage  = [backBackgroundImage stretchableImageWithLeftCapWidth:backBackgroundImage.size.width/2 topCapHeight:backBackgroundImage.size.height/2];
    [backButton setBackgroundImage:backtretchableBackgroundImage forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"icon_left"] forState:UIControlStateNormal];
    [self addSubview:backButton];
    self.backButton = backButton;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.bottom.equalTo(backgroundImageView);
        make.width.equalTo(self).multipliedBy(0.3);
    }];

    UIButton *nextButton = [[UIButton alloc]init];
    UIImage *nextBackgroundImage = [UIImage imageNamed:@"bg_calendar_top_right.9"];
    UIImage *nextTretchableBackgroundImage  = [nextBackgroundImage stretchableImageWithLeftCapWidth:nextBackgroundImage.size.width/2 topCapHeight:nextBackgroundImage.size.height/2];
    [nextButton setBackgroundImage:nextTretchableBackgroundImage forState:UIControlStateNormal];
    [nextButton setImage:[UIImage imageNamed:@"icon_right"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextButton];
    self.nextButton = nextButton;
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.bottom.equalTo(backgroundImageView);
        make.width.equalTo(backButton);
    }];
    
    UIImageView *leftLinkImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_calendar_binding"]];
//    leftLinkImageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:leftLinkImageView];
    [leftLinkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(backButton.right).offset(20);
        make.size.equalTo(CGSizeMake(10, 20));
    }];
    
    
    UIImageView *rightLinkImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_calendar_binding"]];
    [self addSubview:rightLinkImageView];
    [rightLinkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.right.equalTo(nextButton.left).offset(-20);
        make.size.equalTo(CGSizeMake(10, 20));
    }];
    
    
    UIView *weekDayView = [[UIView alloc]init];
//    weekDayView.alpha = 0;
    weekDayView.backgroundColor = [UIColor whiteColor];
    [self addSubview:weekDayView];
    self.weekDayView = weekDayView;
    [self.weekDayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-1);
        make.top.equalTo(self.backgroudImageView.bottom);
    }];
    
    UILabel *lastWeekDayLabel = nil;
    NSArray *weeks = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六",];
    for (int index = 0; index < 7; index++) {
        
        UILabel *weekDayLabel = [[UILabel alloc]init];
        weekDayLabel.font = [UIFont systemFontOfSize:18];
//        weekDayLabel.backgroundColor = [UIColor yellowColor];
        weekDayLabel.textAlignment = NSTextAlignmentCenter;
        weekDayLabel.text = weeks[index];
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
