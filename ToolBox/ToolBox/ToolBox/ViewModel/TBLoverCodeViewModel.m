//
//  TBLoverCodeViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLoverCodeViewModel.h"
#import "TBLoverCodeCollectionViewCell.h"
#import "TBBriefIntroductionView.h"

@interface TBLoverCodeViewModel ()

@property (nonatomic,strong) UIViewController  *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;

@end

static NSString * const identifier = @"loverCode";

@implementation TBLoverCodeViewModel


- (instancetype)initWithTarget:(UIViewController *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupComponent];
        [self setupSourceData];
        
    }
    return self;
}


- (void)setupTarget:(UIViewController *)target {
    
    if (target) {
        self.target = target;
    }
}

- (void)setupComponent {
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]init];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
}

- (void)setupSourceData {
    
    
}


- (NSString *)stringForIdentifier {
    return identifier;
}


@end
