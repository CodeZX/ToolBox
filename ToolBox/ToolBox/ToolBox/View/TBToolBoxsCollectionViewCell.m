//
//  TBToolBoxsCollectionViewCell.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBToolBoxsCollectionViewCell.h"

@interface TBToolBoxsCollectionViewCell  ()

@property (nonatomic,weak) UIImageView *iconImageView;
@property (nonatomic,weak) UILabel *titleLabel;
@end
@implementation TBToolBoxsCollectionViewCell


+ (TBToolBoxsCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (collectionView && identifier) {
        TBToolBoxsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame  {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 0.5;
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
//    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView).offset(-10);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"恋人特码";
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.iconImageView.bottom).offset(10);
    }];
    
    
}

- (void)setItemModel:(TBToolBoxItemModel *)itemModel {
    
    _itemModel = itemModel;
    self.iconImageView.image = [UIImage imageNamed:itemModel.imageName];
    self.titleLabel.text = itemModel.title;
    
}
@end
