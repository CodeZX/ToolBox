//
//  TBRandomPickerView.h
//  ToolBox
//
//  Created by 周鑫 on 2019/8/6.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TBRandomPickerView;

typedef NS_ENUM(NSUInteger, RandomPickerViewType) {
    RandomPickerViewTypeNumber,
    RandomPickerViewTypeZodiac,
 
};


@protocol TBRandomPickerViewDelegate <NSObject>

- (void)randomPickerView:(TBRandomPickerView *)pickerView randomResult:(NSString *)result;
- (void)randomPickerView:(TBRandomPickerView *)pickerView complete:(BOOL)complete;
@end



@interface TBRandomPickerView : UIView

- (instancetype)initWithType:(RandomPickerViewType)type;
@property (nonatomic,weak) id<TBRandomPickerViewDelegate> delegate;
@property (nonatomic,assign) RandomPickerViewType type;
@end




NS_ASSUME_NONNULL_END
