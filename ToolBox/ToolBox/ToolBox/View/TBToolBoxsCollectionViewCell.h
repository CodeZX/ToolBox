//
//  TBToolBoxsCollectionViewCell.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBToolBoxItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBToolBoxsCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) TBToolBoxItemModel *itemModel;

+ (TBToolBoxsCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
