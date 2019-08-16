//
//  TBToolBoxItemModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/8/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBToolBoxItemModel.h"

@implementation TBToolBoxItemModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetVC:(nonnull NSString *)vcName {
    self  = [super init];
    if (self) {
        self.title = title;
        self.imageName = imageName;
        self.targetVC = vcName;
    }
    return self;
}
@end
