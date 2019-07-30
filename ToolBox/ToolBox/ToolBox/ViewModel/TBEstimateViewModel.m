//
//  TBEstimateViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/26.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBEstimateViewModel.h"
#import "TBBriefIntroductionView.h"

@interface TBEstimateViewModel ()

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UILabel *promptLabel;

@property (nonatomic,weak) UILabel *requestZodiacLabel;
@property (nonatomic,weak) UILabel *requestNumberLabel;
@property (nonatomic,weak) UIButton *requesZodiacButton;
@property (nonatomic,weak) UIButton *requestNumberButton;

@property (nonatomic,weak) UIImageView *zhugeImageView;
@property (nonatomic,weak) UIImageView *bookImageView;

@end

@implementation TBEstimateViewModel

- (instancetype)initWithTarget:(UIViewController *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupSourceData];
        [self setupComponent];
        [self setupAssociate];
        
    }
    return self;
    
}

- (void)setupTarget:(UIViewController *)target {
    
    if (target) {
        self.target = target;
       
    }
    
}

- (void)setupSourceData  {
    
    
}

- (void)setupComponent {
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"天机泄密啦！所求何时，让诸葛丞相为您卜一卦，祝您六合彩顺风顺水。"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(80);
    }];

    UILabel *requestZodiacLabel = [[UILabel alloc]init];
    requestZodiacLabel.text = @"求生肖";
    [self.target.view addSubview:requestZodiacLabel];
    self.requestZodiacLabel = requestZodiacLabel;
    [self.requestZodiacLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(100);
        make.right.equalTo(self.target.view.centerX).offset(-100);
    }];

    UIButton *requestZodiacButton = [[UIButton alloc]init];
    [requestZodiacButton setTitle:@"兔 龙 羊" forState:UIControlStateNormal];
    requestZodiacButton.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:requestZodiacButton];
    self.requesZodiacButton = requestZodiacButton;
    [self.requesZodiacButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.requestZodiacLabel.bottom).offset(10);
        make.centerX.equalTo(self.requestZodiacLabel);
    }];


    UILabel *requestNumberLabel = [[UILabel alloc]init];
    requestNumberLabel.text = @"求尾数";
    [self.target.view addSubview:requestNumberLabel];
    self.requestNumberLabel = requestNumberLabel;
    [self.requestNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(100);
        make.left.equalTo(self.target.view.centerX).offset(100);
    }];

    UIButton *requestNumberButton = [[UIButton alloc]init];
    [requestNumberButton setTitle:@"0 3 7" forState:UIControlStateNormal];
    requestNumberButton.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:requestNumberButton];
    self.requestNumberButton = requestNumberButton;
    [self.requestNumberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.requestNumberLabel.bottom).offset(10);
        make.centerX.equalTo(self.requestNumberLabel);
    }];
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"小提示：每期只能进行一次天机测算！";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
}

- (void)setupAssociate {

}



@end
