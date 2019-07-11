//
//  TBShakeView.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/9.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBShakeView : UIView
- (void)startSharke:(void (^)(BOOL finished))completion;
- (void)stopSharke;
- (void)startForecastAnimation;
@end

NS_ASSUME_NONNULL_END
