//
//  TBPickNumberButton.h
//  ToolBox
//
//  Created by 周鑫 on 2019/8/13.
//  Copyright © 2019 ZX. All rights reserved.
//



#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PickNumberButtonType) {
    PickNumberButtonTypeSingleAndDouble,            // 单双
    PickNumberButtonTypeBigSingleAndBigDouble,      /// 大单 大双
    PickNumberButtonTypeColorWave,                  // 红波  蓝波  绿波
    PickNumberButtonTypeColorWaveAndSingle,         //  波和单双
    PickNumberButtonTypeZodiac,                // 生肖
    PickNumberButtonTypeMantissa,                   // 尾数
    PickNumberButtonTypeBigAndSmall,                 // 大小
    PickNumberButtonTypeFiveElements,               //五行
    PickNumberButtonTypeAnimal,
    PickNumberButtonTypeHeadCount,// 家畜 野兽
};

@interface TBPickNumberButton : UIButton


@property (nonatomic,strong) NSArray *numbers;
@property (nonatomic,assign) PickNumberButtonType type;

- (instancetype)initWithTitle:(NSString *)title  forNumbers:(NSArray *)numbers type:(PickNumberButtonType)type;

@end

NS_ASSUME_NONNULL_END
