//
//  TBBallView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/31.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBBallView.h"

@interface TBBallView ()

@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UILabel *numberLabel;
@property (nonatomic,strong) NSString *number;
@end



@implementation TBBallView

- (instancetype)initWithNumber:(NSString *)number {
    self = [super init];
    if (self) {
        self.number = number;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI {
    
    int  randomNumber = random()% 3 + 1;
    NSString *imageName = nil;
    switch (randomNumber) {
        case 1:
            imageName = @"ball_blue_tool_lover";
            break;
        case 2:
            imageName = @"ball_red_tool_lover";
            break;
        case 3:
            imageName = @"ball_green_tool_lover";
            break;
            
        default:
            break;
    }
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [self addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsZero);
    }];
    
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.text  = self.number;
    numberLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:numberLabel];
    self.numberLabel = numberLabel;
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
}

- (void)setNumberString:(NSString *)numberString {
    
    _numberString = numberString;
    self.numberLabel.text = numberString;
}
@end
