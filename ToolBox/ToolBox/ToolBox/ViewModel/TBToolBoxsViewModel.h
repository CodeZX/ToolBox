//
//  TBToolBoxsViewModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBToolBoxsViewModel : NSObject
- (instancetype)initWithTarget:(UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *)target;
- (NSString *)stringForIdentifier;
@end

NS_ASSUME_NONNULL_END
