//
//  TBDisplayCodesView.h
//  ToolBox
//
//  Created by 周鑫 on 2019/8/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TBPickNumberButton;

NS_ASSUME_NONNULL_BEGIN

@interface TBDisplayCodesView : UIView
- (void)addPickNumberButton:(TBPickNumberButton *)btn;
- (void)removePickNumberButton:(TBPickNumberButton *)btn;
- (void)clearResult;
- (NSArray *)getResults;
@end


@interface TBDisplayCodesViewCell : UICollectionViewCell

@property (nonatomic,strong) NSString *title;

@end

NS_ASSUME_NONNULL_END

