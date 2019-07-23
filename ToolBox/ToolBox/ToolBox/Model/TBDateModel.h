//
//  TBDateModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/23.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBDateModel : NSObject

@property (nonatomic,strong) NSString *dateString;
@property (nonatomic,strong) NSDateComponents *dateComponents;
@property (nonatomic,assign,getter=isSelect) BOOL *select;
@property (nonatomic,assign,getter=isLottery) BOOL *lottery;

- (instancetype)initWithDatecomponts:(NSDateComponents *)dateComponents lottery:(BOOL)isLottery;


@end

NS_ASSUME_NONNULL_END
