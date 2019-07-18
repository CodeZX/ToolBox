//
//  TBTurntableViewModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/17.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBTurntableViewModel : NSObject
- (instancetype)initWithTarget:(UIViewController *)target;
- (void)startAnimation;
@end

NS_ASSUME_NONNULL_END
