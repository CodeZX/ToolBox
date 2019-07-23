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
    
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    backgroundImageView.backgroundColor  =  [UIColor redColor];
    [self.contentView addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    

    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.font = [UIFont systemFontOfSize:11];
    dateLabel.text = @"1";
    [self.contentView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    
    UIImageView *selectImageView = [[UIImageView alloc]init];
    selectImageView.alpha = 0;
    selectImageView.backgroundColor  =  [UIColor yellowColor];
    [self.contentView addSubview:selectImageView];
    self.selectImageView = selectImageView;
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.center.equalTo(self.contentView);
        make.size.equalTo(self.contentView).sizeOffset(CGSizeMake(-5, -5));
    }];
    
    
    UIImageView *currentDateImageView = [[UIImageView alloc]init];
    currentDateImageView.alpha = 0;
    currentDateImageView.backgroundColor  =  [UIColor blueColor];
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
