//
//  TBZodiacCardModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/6.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBZodiacCardModel.h"

@implementation TBZodiacCardModel
- (instancetype)initWithZodiac:(NSString *)zodiac picturePath:(NSString *)picturePath {
    self = [super init];
    if (self) {
        self.zodiac = zodiac;
        self.picturePath = picturePath;
    }
    return self;
}
@end
