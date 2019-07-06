//
//  TBZodiacCardViewModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@class TBZodiacCardModel;
@interface TBZodiacCardViewModel : NSObject
- (instancetype)initWithTarget:(UIViewController<UICollectionViewDelegate,UICollectionViewDataSource> *)target;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (TBZodiacCardModel *)zodiaccardModelForItemAtIndexPath:(nonnull NSIndexPath *)indexPath;
- (void)selectItemAtindexPath:(NSIndexPath *)indexPath;
- (NSString *)stringForIdentifier;
@end

NS_ASSUME_NONNULL_END
