//
//  TBCalendarView.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBCalendarView : UIView
- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)reloadData:(NSArray *)dataSource;
@end



@interface TBCalendarHeaderView : UICollectionReusableView

@end


@interface TBCalendarFootView : UICollectionReusableView

@end

NS_ASSUME_NONNULL_END
