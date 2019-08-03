//
//  TBCalendarViewCell.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBCalendarViewCell.h"

@interface TBCalendarViewCell ()

@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UILabel *dateLabel;
@property (nonatomic,weak) UIImageView *selectImageView;
@property (nonatomic,weak) UIImageView *currentDateImageView;

@end


static NSString * const identifier = @"calenderViewCell";
@implementation TBCalendarViewCell


+ (TBCalendarViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView && identifier) {
        TBCalendarViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return cell;
    }
    return nil;
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_date"]];
//    backgroundImageView.backgroundColor  =  [UIColor whiteColor];
    [self.contentView addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
        make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView).multipliedBy(0.7);
    }];
    

    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.font = [UIFont boldSystemFontOfSize:16];
    dateLabel.text = @"1";
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    
    UIImageView *selectImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_date_rope01"]];
//    selectImageView.alpha = 0;
    [self.contentView addSubview:selectImageView];
    self.selectImageView = selectImageView;
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView).multipliedBy(0.6);
    }];
    
    
    UIImageView *currentDateImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_date_rope02"]];
    currentDateImageView.alpha = 0;
    [self.contentView addSubview:currentDateImageView];
    self.currentDateImageView = currentDateImageView;
    [self.currentDateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView).sizeOffset(CGSizeMake(-5, -5));
    }];
    
    
}

- (void)setDateModel:(TBDateModel *)dateModel {
    
    _dateModel = dateModel;
    
    self.dateLabel.text = dateModel.dateString;
    
    
}

@end
