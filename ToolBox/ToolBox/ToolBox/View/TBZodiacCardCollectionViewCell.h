//
//  TBZodiacCardCollectionViewCell.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBZodiacCardCollectionViewCell : UICollectionViewCell

+ (TBZodiacCardCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
