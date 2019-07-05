//
//  TBZodiacCardCollectionViewCell.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBZodiacCardCollectionViewCell.h"


@interface TBZodiacCardCollectionViewCell   ()

@property (nonatomic,weak) UIImageView *cardImageView;
@end
@implementation TBZodiacCardCollectionViewCell

+ (TBZodiacCardCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    
    TBZodiacCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
//    self.contentView.backgroundColor = [UIColor redColor];
    UIImageView *cardImageView = [[UIImageView alloc]init];
    cardImageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:cardImageView];
    self.cardImageView = cardImageView;
    [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(2, 2, 2, 2));
    }];
    
    
}
@end