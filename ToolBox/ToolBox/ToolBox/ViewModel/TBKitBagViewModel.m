//
//  TBKitBagViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBKitBagViewModel.h"
#import "TBBriefIntroductionView.h"
@interface TBKitBagViewModel ()

@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UILabel *periodsLabel;
@property (nonatomic,weak) UIImageView *pictureImageView;
@property (nonatomic,weak) UILabel *puzzleLabel;
@property (nonatomic,weak) UIButton *openPuzzleButton;
@property (nonatomic,weak) UIButton *pastPuzzlesButton;
@property (nonatomic,weak) UILabel *promptLabel;

@end
@implementation TBKitBagViewModel
- (instancetype)initWithTarget:(UIViewController *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupComponent];
        [self setupSourceData];
        [self setupAssociate];

    }
    return self;

}

- (void)setupTarget:(UIViewController *)target {
    
    if (target) {
        self.target = target;
    }
    
}

- (void)setupComponent {
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"十万六合彩用户都说准的谜题，这一期，您猜出了什么玄机?"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    UILabel *periodsLabel = [[UILabel alloc]init];
    periodsLabel.text = @"2019n年第79期六合锦囊";
    [self.target.view addSubview:periodsLabel];
    self.periodsLabel = periodsLabel;
    [self.periodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(20);
        make.centerX.equalTo(self.target.view);
        
    }];
    
    
    UIImageView *pictureImageView = [[UIImageView alloc]init];
    
    pictureImageView.backgroundColor = [UIColor blueColor];
    [self.target.view addSubview:pictureImageView];
    self.pictureImageView = pictureImageView;
    [self.pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.periodsLabel.bottom).offset(10);
        make.centerX.equalTo(self.periodsLabel);
        make.size.equalTo(CGSizeMake(100, 120));
    }];
    
    
    UIButton *openPuzzleButton = [[UIButton alloc]init];
    [openPuzzleButton setTitle:@"打开锦囊" forState:UIControlStateNormal];
    openPuzzleButton.backgroundColor = [UIColor yellowColor];
    [openPuzzleButton addTarget:self action:@selector(openPuzzleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:openPuzzleButton];
    self.openPuzzleButton = openPuzzleButton;
    [self.openPuzzleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureImageView.bottom).offset(10);
        make.centerX.equalTo(self.pictureImageView);
        make.size.equalTo(CGSizeMake(200, 60));
    }];
    
    
    UILabel *puzzleLabel = [[UILabel alloc]init];
    puzzleLabel.numberOfLines = 0;
    puzzleLabel.alpha = 0;
    puzzleLabel.text  = @"独坐幽李果，弹琴复长啸。\n深林人不知，明月来相照。";
    [self.target.view addSubview:puzzleLabel];
    self.puzzleLabel = puzzleLabel;
    [self.puzzleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureImageView.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
        
    }];
    
    
    UIButton *pastPuzzlesButton = [[UIButton alloc]init];
    [pastPuzzlesButton setTitle:@"往期历史" forState:UIControlStateNormal];
    pastPuzzlesButton.backgroundColor = [UIColor yellowColor];
    [pastPuzzlesButton addTarget:self action:@selector(pastPuzzlesClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:pastPuzzlesButton];
    self.pastPuzzlesButton = pastPuzzlesButton;
    [self.pastPuzzlesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.openPuzzleButton.bottom).offset(10);
        make.centerX.equalTo(self.openPuzzleButton);
        make.size.equalTo(CGSizeMake(200, 60));
    }];
    
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.numberOfLines = 0;
    promptLabel.font = [UIFont systemFontOfSize:11];
    promptLabel.text = @"小贴士：打开锦囊将获得本期的一道六合彩谜题，参透谜题将获得本期中将号码，快来开启您的玄机之旅吧！";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.target.view.left).offset(10);
        make.right.equalTo(self.target.view.right).offset(-10);
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
    
    
}

- (void)setupSourceData {
    
    
}



- (void)setupAssociate {
    
    
}


- (void)openPuzzleClick:(UIButton *)sender {
    
    [UIView transitionWithView:self.pictureImageView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.openPuzzleButton.alpha = 0;
        self.puzzleLabel.alpha = 1;
        self.pictureImageView.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)pastPuzzlesClick:(UIButton *)sender {
    
    
}


@end
