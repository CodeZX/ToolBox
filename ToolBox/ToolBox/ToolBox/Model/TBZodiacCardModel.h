//
//  TBZodiacCardModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/7/6.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBZodiacCardModel : NSObject

@property (nonatomic,strong) NSString *zodiac;
@property (nonatomic,strong) NSString *picturePath;

- (instancetype)initWithZodiac:(NSString *)zodiac picturePath:(NSString *)picturePath;
@end

NS_ASSUME_NONNULL_END
