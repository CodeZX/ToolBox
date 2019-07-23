//
//  TBCalendarViewCell.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBDateModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TBCalendarViewCell : UICollectionViewCell
@property (nonatomic,strong) TBDateModel *dateModel;
+ (TBCalendarViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
