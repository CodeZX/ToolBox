//
//  TBBriefIntroductionView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBBriefIntroductionView.h"

@interface TBBriefIntroductionView ()

@property (nonatomic,weak) UIImageView *backgroundImageView;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel * contentLabel;
@property (nonatomic,strong) NSString *contentsString;
@end
@implementation TBBriefIntroductionView


- (instancetype)initWithContentString:(NSString *)content {
    self = [super init];
    if (self) {
         self.contentsString = content;
        [self setupUI];
       
    }
    return self;
    
}



- (void)setupUI {
    
    

    UIImage *image = [UIImage imageNamed:@"bg_history_top.9"];
    UIImage *i = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height/2, image.size.width/2, image.size.height/2, image.size.width/2) resizingMode:UIImageResizingModeStretch];
    UIImageView *backgroundImageView  = [[UIImageView alloc]initWithImage:i];
    [self addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"简介";
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20);
        make.left.equalTo(35);
        
    }];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.numberOfLines = 0;
    contentLabel.text = self.contentsString;
    contentLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(10);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(-20);
    }];
    

    
}
@end
