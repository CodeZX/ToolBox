//
//  TBShakeViewModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/8.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBShakeViewModel : NSObject

- (instancetype)initWithTarget:(UIViewController *)target;
- (void)startShake:(void (^)(BOOL finished))completion;
- (void)stopShake;
- (void)startForecast;
@end

NS_ASSUME_NONNULL_END
