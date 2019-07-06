//
//  TBZodiacCardCollectionViewCell.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TBZodiacCardModel;
NS_ASSUME_NONNULL_BEGIN


@interface TBZodiacCardCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) TBZodiacCardModel *zodiacCardModel;
+ (TBZodiacCardCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)startRotationAnimation:(void (^ __nullable)(BOOL finished))completion;
@end

NS_ASSUME_NONNULL_END
