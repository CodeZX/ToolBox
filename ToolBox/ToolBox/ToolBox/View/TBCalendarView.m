//
//  TBCalendarView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBCalendarView.h"
#import "TBCalendarViewCell.h"

@interface TBCalendarView   ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;
@end

static NSString * const cellIdentifier = @"cellCcalendarViewcell";
static NSString * const headerIdentifier = @"headerCalendarViewcell";
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





- (void)setupUI {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing =  0;
//    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3.0, [UIScreen mainScreen].bounds.size.width/3.0);
    layout.itemSize = CGSizeMake(50, 50);
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20,[UIScreen mainScreen].bounds.size.height);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[TBCalendarViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [collectionView registerClass:[TBCalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];

    
    
    
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
        
    }
    
    return nil;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return  CGSizeMake(300, 44);
}



@end

@interface TBCalendarHeaderView ()

@property (nonatomic,weak) UILabel *dateLabel;
@property (nonatomic,weak) UIButton *nextButton;
@property (nonatomic,weak) UIButton *backButton;

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
    dateLabel.text = @"2019年7月23";
    [self addSubview:dateLabel];
    self.dateLabel  = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    
    UIButton *backButton = [[UIButton alloc]init];
    [backButton setTitle:@"<<" forState:UIControlStateNormal];
    [self addSubview:backButton];
    self.backButton = backButton;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(self.backButton.width);
    }];

    UIButton *nextButton = [[UIButton alloc]init];
    [nextButton setTitle:@">>" forState:UIControlStateNormal];
    [self addSubview:nextButton];
    self.nextButton = nextButton;
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.equalTo(self.nextButton.width);
    }];
    
    
   
    
    
}
@end
