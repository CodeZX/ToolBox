//
//  TBDateModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/23.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBDateModel.h"

@implementation TBDateModel

- (instancetype)initWithDatecomponts:(NSDateComponents *)dateComponents lottery:(BOOL)isLottery {
    self = [super init];
    if (self) {
        if (dateComponents) {
            self.dateComponents = dateComponents;
            self.dateString = [NSString stringWithFormat:@"%lu",dateComponents.day];
        }
    }
    return self;
    
}


- (NSString *)description {
    
    return [NSString stringWithFormat:@"\n{\n   dateStirng:%@\n    dateCom:%@\n}",self.dateString,self.dateComponents];
}
@end
