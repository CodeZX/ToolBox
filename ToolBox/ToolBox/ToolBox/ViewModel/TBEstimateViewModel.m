//
//  TBEstimateViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/26.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBEstimateViewModel.h"
#import "TBBriefIntroductionView.h"
#import "CLZoomPickerView.h"
#import "TBRandomPickerView.h"
@interface TBEstimateViewModel ()<TBRandomPickerViewDelegate>

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UILabel *promptLabel;

@property (nonatomic,weak) UILabel *requestZodiacLabel;
@property (nonatomic,weak) UILabel *requestNumberLabel;
@property (nonatomic,weak) UIButton *requesZodiacButton;
@property (nonatomic,weak) UIButton *requestNumberButton;

@property (nonatomic,weak) UIImageView *zhugeImageView;
@property (nonatomic,weak) UIImageView *bookImageView;



@property (nonatomic,weak) UIPickerView *pickerView;
@property (nonatomic,weak) TBRandomPickerView *randomPickerView;

@property (nonatomic,weak) UIView *maskView;

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
        make.height.equalTo(100);
    }];

    UILabel *requestZodiacLabel = [[UILabel alloc]init];
    requestZodiacLabel.text = @"求生肖";
    [self.target.view addSubview:requestZodiacLabel];
    self.requestZodiacLabel = requestZodiacLabel;
    [self.requestZodiacLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(50);
        make.right.equalTo(self.target.view.centerX).offset(-80);
    }];

    UIButton *requestZodiacButton = [[UIButton alloc]init];
    [requestZodiacButton setTitle:@"开始" forState:UIControlStateNormal];
    [requestZodiacButton setBackgroundImage:[UIImage imageNamed:@"btn_common_disabled.9"] forState:UIControlStateNormal];
    [requestZodiacButton addTarget:self action:@selector(requestZodiacClick:) forControlEvents:UIControlEventTouchUpInside];
//    requestZodiacButton.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:requestZodiacButton];
    self.requesZodiacButton = requestZodiacButton;
    [self.requesZodiacButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.requestZodiacLabel.bottom).offset(10);
        make.centerX.equalTo(self.requestZodiacLabel);
        make.width.equalTo(80);
        make.height.equalTo(40);
    }];


    UILabel *requestNumberLabel = [[UILabel alloc]init];
    requestNumberLabel.text = @"求尾数";
    [self.target.view addSubview:requestNumberLabel];
    self.requestNumberLabel = requestNumberLabel;
    [self.requestNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(50);
        make.left.equalTo(self.target.view.centerX).offset(80);
    }];

    UIButton *requestNumberButton = [[UIButton alloc]init];
    [requestNumberButton setTitle:@"开始" forState:UIControlStateNormal];
    [requestNumberButton addTarget:self action:@selector(requestNumberClick:) forControlEvents:UIControlEventTouchUpInside];
     [requestNumberButton setBackgroundImage:[UIImage imageNamed:@"btn_common_disabled.9"] forState:UIControlStateNormal];
    [self.target.view addSubview:requestNumberButton];
    self.requestNumberButton = requestNumberButton;
    [self.requestNumberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.requestNumberLabel.bottom).offset(10);
        make.centerX.equalTo(self.requestNumberLabel);
        make.width.equalTo(80);
        make.height.equalTo(40);
    }];
    
    UIImageView *zhugeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_cal.jpg"]];
    [self.target.view addSubview:zhugeImageView];
    self.zhugeImageView = zhugeImageView;
    [self.zhugeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.target.view.centerY);
        make.centerX.equalTo(self.target.view);
        make.left.equalTo(self.target.view).offset(50);
        make.right.equalTo(self.target.view).offset(-50);
        make.height.equalTo(zhugeImageView.width);
        
    }];
    
    

    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.font = [UIFont systemFontOfSize:13];
    promptLabel.textColor = [UIColor orangeColor];
    promptLabel.text = @"小提示：每期只能进行一次天机测算！";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view).offset(-20);
        make.centerX.equalTo(self.target.view);
    }];
}

- (void)setupAssociate {

}


- (void)requestZodiacClick:(UIButton *)sender {
    
    
    UIView *maskView = [[UIView alloc]init];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.6;
    [self.target.view addSubview:maskView];
    self.maskView = maskView;
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.target.view);
    }];
    
    
    TBRandomPickerView *randomPickerView = [[TBRandomPickerView alloc]initWithType:RandomPickerViewTypeZodiac];
    randomPickerView.delegate = self;
    [self.target.view addSubview:randomPickerView];
    self.randomPickerView = randomPickerView;
    [randomPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(300);
    }];
}


- (void)requestNumberClick:(UIButton *)sneder {
    
    
    UIView *maskView = [[UIView alloc]init];
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.6;
    [self.target.view addSubview:maskView];
    
    self.maskView = maskView;
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.target.view);
    }];
    
    TBRandomPickerView *randomPickerView = [[TBRandomPickerView alloc]initWithType:RandomPickerViewTypeNumber];
    randomPickerView.delegate = self;
    [self.target.view addSubview:randomPickerView];
    self.randomPickerView = randomPickerView;
    [randomPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.target.view);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(300);
    }];
    
}
- (void)randomPickerView:(TBRandomPickerView *)pickerView randomResult:(NSString *)result {
    
    if (pickerView.type == RandomPickerViewTypeZodiac) {
        
        [self.requesZodiacButton setTitle:result forState:UIControlStateNormal];
        
    } else if (pickerView.type == RandomPickerViewTypeNumber) {
        [self.requestNumberButton setTitle:result forState:UIControlStateNormal];
    }
    
}

- (void)randomPickerView:(TBRandomPickerView *)pickerView complete:(BOOL)complete {

    if (complete) {
        [UIView animateWithDuration:0.7 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            self.randomPickerView.alpha = 0;
           
        } completion:^(BOOL finished) {
            if (finished) {
                 [self.randomPickerView removeFromSuperview];
                 [self.maskView removeFromSuperview];
                 self.maskView = nil;
                 self.randomPickerView = nil;
            }
        }];
    }
}




@end
