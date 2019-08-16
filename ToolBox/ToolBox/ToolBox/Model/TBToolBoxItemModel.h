//
//  TBToolBoxItemModel.h
//  ToolBox
//
//  Created by 周鑫 on 2019/8/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBToolBoxItemModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *targetVC;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetVC:(NSString *)vcName;
@end

NS_ASSUME_NONNULL_END
