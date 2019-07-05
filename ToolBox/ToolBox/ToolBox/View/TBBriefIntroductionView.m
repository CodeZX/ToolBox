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
    
    
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1;
    UIImageView *backgroundImageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
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
        make.top.left.equalTo(10);
    }];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.numberOfLines = 0;
    contentLabel.text = self.contentsString;
//    contentLabel.text = @"请输入您和他/她的生日。计算本期特码，赶紧来试试！";
    contentLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(5);
        make.left.equalTo(10);
        make.right.equalTo(-10);
    }];
    

    
}
@end
