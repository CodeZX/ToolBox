//
//  TBPickNumberViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/8/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBPickNumberViewModel.h"
#import "TBDisplayCodesView.h"
#import "TBPickNumberButton.h"


@interface TBPickNumberViewModel    ()

    


@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,weak) TBDisplayCodesView *displayCodesView;
@property (nonatomic,weak) UIButton *clearButton;
@property (nonatomic,weak) UIButton *replicationResultButton;
@property (nonatomic,weak) UIButton *shareResultButton;




// 选码助手
@property (nonatomic,weak) TBPickNumberButton *singleButton;
@property (nonatomic,weak) TBPickNumberButton *doubleButton;

@property (nonatomic,weak) TBPickNumberButton *bigButton;
@property (nonatomic,weak) TBPickNumberButton *smallButton;


@property (nonatomic,weak) TBPickNumberButton *bigSingleButton;
@property (nonatomic,weak) TBPickNumberButton *bigDoubleButton;
@property (nonatomic,weak) TBPickNumberButton *samallSingleButton;
@property (nonatomic,weak) TBPickNumberButton *samallDoubleButton;

@property (nonatomic,weak) TBPickNumberButton *goldButton;
@property (nonatomic,weak) TBPickNumberButton *timberButton;
@property (nonatomic,weak) TBPickNumberButton *waterButton;
@property (nonatomic,weak) TBPickNumberButton *fireButton;
@property (nonatomic,weak) TBPickNumberButton *soilButton;

@property (nonatomic,weak) TBPickNumberButton *reaWaveButton;
@property (nonatomic,weak) TBPickNumberButton *blueWaveButton;
@property (nonatomic,weak) TBPickNumberButton *greenWaveButton;

@property (nonatomic,weak) TBPickNumberButton *fowlButton;
@property (nonatomic,weak) TBPickNumberButton *beastButton;

@property (nonatomic,weak) TBPickNumberButton *redSingleButton;
@property (nonatomic,weak) TBPickNumberButton *redDoubleButton;
@property (nonatomic,weak) TBPickNumberButton *blueSingleButton;
@property (nonatomic,weak) TBPickNumberButton *blueDoubleButton;
@property (nonatomic,weak) TBPickNumberButton *greenSingleButton;
@property (nonatomic,weak) TBPickNumberButton *greenDoubleButton;


@property (nonatomic,weak) TBPickNumberButton *mouseButton;
@property (nonatomic,weak) TBPickNumberButton *cattleButton;
@property (nonatomic,weak) TBPickNumberButton *tigerButton;
@property (nonatomic,weak) TBPickNumberButton *hareButton;
@property (nonatomic,weak) TBPickNumberButton *dragonButton;
@property (nonatomic,weak) TBPickNumberButton *serpentButton;
@property (nonatomic,weak) TBPickNumberButton *horseButton;
@property (nonatomic,weak) TBPickNumberButton *sheepButton;
@property (nonatomic,weak) TBPickNumberButton *monkeyButton;
@property (nonatomic,weak) TBPickNumberButton *chickenButton;
@property (nonatomic,weak) TBPickNumberButton *dogButton;
@property (nonatomic,weak) TBPickNumberButton *pigButton;



@property (nonatomic,weak) TBPickNumberButton *zeroMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *oneMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *twoMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *threeMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *fourMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *fiveMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *sixMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *sevenMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *eightMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *nineMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *bigMantissaButton;
@property (nonatomic,weak) TBPickNumberButton *smallMantissaButton;

@property (nonatomic,weak) UIView *line1;
@property (nonatomic,weak) UIView *line2;
@property (nonatomic,weak) UIView *line3;
@property (nonatomic,weak) UIView *line4;
@property (nonatomic,weak) UIView *line5;
@property (nonatomic,weak) UIView *line6;
@property (nonatomic,weak) UIView *line7;
@property (nonatomic,weak) UIView *line8;
@property (nonatomic,weak) UIView *line9;



@property (nonatomic,weak) TBPickNumberButton *zeroHeadButton;
@property (nonatomic,weak) TBPickNumberButton *oneHeadButton;
@property (nonatomic,weak) TBPickNumberButton *twoHeadButton;
@property (nonatomic,weak) TBPickNumberButton *threeHeadButton;
@property (nonatomic,weak) TBPickNumberButton *fourHeadButton;

@property (nonatomic,weak) TBPickNumberButton *selectSingleOrDoubleButton;
@property (nonatomic,weak) TBPickNumberButton *selectBigOrSmallButton;
@property (nonatomic,weak) TBPickNumberButton *selectAnimalButton;



@property (nonatomic,assign) CGFloat BtnMargin;
@property (nonatomic,assign) CGFloat BtnSpace;
@property (nonatomic,assign) CGSize BtnSize;
@end



@implementation TBPickNumberViewModel

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
    
    TBDisplayCodesView *displayCodesView = [[TBDisplayCodesView alloc]init];
    displayCodesView.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:displayCodesView];
    self.displayCodesView = displayCodesView;
    [self.displayCodesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.target.view).offset(UIEdgeInsetsMake(100, 5, 5, 5));
        make.height.equalTo(self.target.view).multipliedBy(0.23);
    }];
    
    UIButton *replicationResultButton = [[UIButton alloc]init];
    [replicationResultButton setTitle:@"复制结果" forState:UIControlStateNormal];
    [replicationResultButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [replicationResultButton addTarget:self action:@selector(copyResultButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    replicationResultButton.titleLabel.font = [UIFont systemFontOfSize:13];
    replicationResultButton.layer.borderWidth = 1;
    replicationResultButton.layer.borderColor = [UIColor redColor].CGColor;
    replicationResultButton.layer.cornerRadius = 5;
    replicationResultButton.layer.masksToBounds = YES;
    replicationResultButton.contentEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    [self.target.view addSubview:replicationResultButton];
    self.replicationResultButton =  replicationResultButton;
    [self.replicationResultButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.displayCodesView.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
        make.height.equalTo(30);
    }];
//    
//
    UIButton *clearButton = [[UIButton alloc]init];
    [clearButton setTitle:@"清空" forState:UIControlStateNormal];
    [clearButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    clearButton.titleLabel.font = [UIFont systemFontOfSize:13];
    clearButton.layer.borderWidth = 1;
    clearButton.layer.borderColor = [UIColor redColor].CGColor;
    clearButton.layer.cornerRadius = 5;
    clearButton.layer.masksToBounds = YES;
    [self.target.view addSubview:clearButton];
    self.clearButton =  clearButton;
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.replicationResultButton);
        make.right.equalTo(self.replicationResultButton.left).offset(-10);
        make.size.equalTo(self.replicationResultButton);
    }];

    UIButton *shareResultButton = [[UIButton alloc]init];
    [shareResultButton setTitle:@"分享结果" forState:UIControlStateNormal];
    [shareResultButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [shareResultButton addTarget:self action:@selector(shareResultButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    shareResultButton.titleLabel.font = [UIFont systemFontOfSize:13];
    shareResultButton.layer.borderWidth = 1;
    shareResultButton.layer.borderColor = [UIColor redColor].CGColor;
    shareResultButton.layer.cornerRadius = 5;
    shareResultButton.layer.masksToBounds = YES;
    [self.target.view addSubview:shareResultButton];
    self.shareResultButton =  shareResultButton;
    [self.shareResultButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.replicationResultButton);
        make.left.equalTo(self.replicationResultButton.right).offset(10);
        make.size.equalTo(self.replicationResultButton);
    }];
    
    
    self.BtnMargin = 5;
    self.BtnSpace = 10;
    CGFloat ballSpaceW = ([UIScreen mainScreen].bounds.size.width - (2 * self.BtnMargin) - (5 * self.BtnSpace))/6.0;
    self.BtnSize = CGSizeMake(ballSpaceW, 22);
    
    //单双
    [self setupSingleAndDoubleButton];
    // 大小
    [self setupBigAndSmall];
    // 大小单双
    [self setupBigSingleAndSmallSingle];
    // 五行
    [self setupFiveElementsButton];
    // 波
    [self setupColorWaveButton];
    // 家畜 野兽
    [self setupAnimalButton];
    // 颜色单双
    [self setupColorSingleAndColorDouble];
    // 生肖
    [self setupZodiacButton];
    // 尾数
    [self setupMantissaButton];
    // 头数
    [self setupHeadCountButton];
    


}

- (void)copyResultButtonClick:(UIButton *)btn {
    
//    [self.displayCodesView getResults];
}
- (void)clearButtonClick:(UIButton *)btn {
    
    [self.target.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[TBPickNumberButton class]]) {
            TBPickNumberButton *btn = (TBPickNumberButton *)obj;
            btn.selected = NO;
        }
    }];
    
    [self.displayCodesView clearResult];
    
}

- (void)shareResultButtonClick:(UIButton *)btn {
    //    [self.displayCodesView getResults];
    
}

- (void)setupSingleAndDoubleButton {
    
    
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line1];
    self.line1 = line1;
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.clearButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    NSArray *singleNumbers = @[@"01",@"03",@"05",@"07",@"09",@"11",@"13",@"15",@"17",@"19",@"20",@"21",@"23",@"25",@"27",@"29",@"31",@"33",@"35",@"37",@"39",@"41",@"43",@"45",@"47",@"49"];
    TBPickNumberButton *singleButton = [[TBPickNumberButton alloc]initWithTitle:@"单" forNumbers:singleNumbers type:PickNumberButtonTypeSingleAndDouble];
    [singleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:singleButton];
    self.singleButton = singleButton;
    self.singleButton.backgroundColor = [UIColor redColor];
    [self.singleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.target.view).offset(self.BtnMargin);
        make.top.equalTo(self.line1.bottom).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *doubleNumbers = @[@"02",@"04",@"06",@"08",@"10",@"12",@"14",@"16",@"18",@"20",@"22",@"24",@"26",@"28",@"30",@"32",@"34",@"36",@"38",@"40",@"42",@"44",@"46",@"48"];
    TBPickNumberButton *doubleButton = [[TBPickNumberButton alloc]initWithTitle:@"双" forNumbers:doubleNumbers type:PickNumberButtonTypeSingleAndDouble];
    [doubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:doubleButton];
    self.doubleButton = doubleButton;
    [self.doubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singleButton);
        make.left.equalTo(self.singleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
    }];
    
}


- (void)setupBigAndSmall {
    
    
  
    
    NSArray *bigNumbers = @[@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49"];
    TBPickNumberButton *bigButton = [[TBPickNumberButton alloc]initWithTitle:@"大" forNumbers:bigNumbers type:PickNumberButtonTypeBigAndSmall];
    [bigButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:bigButton];
    self.bigButton = bigButton;
    [self.bigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.target.view.centerX).offset(self.BtnSpace);
        make.top.equalTo(self.line1.bottom).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *smallNumbers = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24"];
    TBPickNumberButton *smallButton = [[TBPickNumberButton alloc]initWithTitle:@"小" forNumbers:smallNumbers type:PickNumberButtonTypeBigAndSmall];
    [smallButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:smallButton];
    self.smallButton = smallButton;
    [self.smallButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigButton);
        make.left.equalTo(self.bigButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
}


- (void)setupBigSingleAndSmallSingle {
    
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line2];
    self.line2 = line2;
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singleButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    NSArray *bigSingleNumbers = @[@"25",@"27",@"29",@"31",@"33",@"35",@"37",@"39",@"41",@"43",@"45",@"47",@"49"];
    TBPickNumberButton *bigSingleButton = [[TBPickNumberButton alloc]initWithTitle:@"大单" forNumbers:bigSingleNumbers type:PickNumberButtonTypeBigSingleAndBigDouble];
    [bigSingleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:bigSingleButton];
    self.bigSingleButton = bigSingleButton;
    [self.bigSingleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.self.line2.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.singleButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
  
    
    NSArray *bigDoubleNumbers = @[@"26",@"28",@"30",@"32",@"34",@"36",@"38",@"40",@"42",@"44",@"46",@"48"];
    TBPickNumberButton *bigDoubleButton = [[TBPickNumberButton alloc]initWithTitle:@"大双" forNumbers:bigDoubleNumbers type:PickNumberButtonTypeBigSingleAndBigDouble];
    [bigDoubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:bigDoubleButton];
    self.bigDoubleButton = bigDoubleButton;
    [self.bigDoubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigSingleButton);
        make.left.equalTo(self.bigSingleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    

    NSArray *samallSingleNumbers = @[@"01",@"03",@"05",@"07",@"09",@"11",@"13",@"15",@"17",@"19",@"20",@"21",@"23"];
    TBPickNumberButton *samallSingleButton = [[TBPickNumberButton alloc]initWithTitle:@"小单" forNumbers:samallSingleNumbers type:PickNumberButtonTypeBigSingleAndBigDouble];
    [samallSingleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:samallSingleButton];
    self.samallSingleButton = samallSingleButton;
    [self.samallSingleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigDoubleButton);
        make.left.equalTo(self.bigDoubleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];


    NSArray *samallDoubleNumbers = @[@"02",@"04",@"06",@"08",@"10",@"12",@"14",@"16",@"18",@"20",@"22",@"24"];
    TBPickNumberButton *samallDoubleButton = [[TBPickNumberButton alloc]initWithTitle:@"小双" forNumbers:samallDoubleNumbers type:PickNumberButtonTypeBigSingleAndBigDouble];
    [samallDoubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:samallDoubleButton];
    self.samallDoubleButton = samallDoubleButton;
    [self.samallDoubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigSingleButton.bottom).offset(self.BtnMargin);
        make.left.equalTo(self.bigSingleButton);
        make.size.equalTo(self.BtnSize);
    }];
    
}

- (void)setupFiveElementsButton {
    
    NSArray *goldNumbers = @[@"05",@"06",@"19",@"20",@"27",@"28",@"35",@"36",@"49"];
    TBPickNumberButton *goldButton = [[TBPickNumberButton alloc]initWithTitle:@"金" forNumbers:goldNumbers type:PickNumberButtonTypeFiveElements];
    [goldButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:goldButton];
    self.goldButton = goldButton;
    [self.goldButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.bigButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    
    NSArray *timberNumbers = @[@"01",@"02",@"09",@"10",@"17",@"18",@"31",@"32",@"39",@"40",@"47",@"48"];
    TBPickNumberButton *timberButton = [[TBPickNumberButton alloc]initWithTitle:@"木" forNumbers:timberNumbers type:PickNumberButtonTypeFiveElements];
    [timberButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:timberButton];
    self.timberButton = timberButton;
    [self.timberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goldButton);
        make.left.equalTo(self.goldButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *waterNumbers = @[@"07",@"08",@"15",@"16",@"23",@"24",@"37",@"38",@"45",@"46"];
    TBPickNumberButton *waterButton = [[TBPickNumberButton alloc]initWithTitle:@"水" forNumbers:waterNumbers type:PickNumberButtonTypeFiveElements];
    [waterButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:waterButton];
    self.waterButton = waterButton;
    [self.waterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timberButton);
        make.left.equalTo(self.timberButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize).priorityLow();
        make.right.lessThanOrEqualTo(self.target.view.right).offset(-self.BtnMargin).priorityHigh();
        
    }];
    
    
    NSArray *fireNumbers = @[@"03",@"11",@"12",@"25",@"26",@"33",@"34",@"41",@"42"];
    TBPickNumberButton *fireButton = [[TBPickNumberButton alloc]initWithTitle:@"火" forNumbers:fireNumbers type:PickNumberButtonTypeFiveElements];
    [fireButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:fireButton];
    self.fireButton = fireButton;
    [self.fireButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goldButton.bottom).offset(self.BtnMargin);
        make.left.equalTo(self.goldButton);
        make.size.equalTo(self.BtnSize);
    }];
    
    NSArray *soilNumbers = @[@"13",@"14",@"21",@"22",@"29",@"30",@"43",@"44"];
    TBPickNumberButton *soilButton = [[TBPickNumberButton alloc]initWithTitle:@"土" forNumbers:soilNumbers type:PickNumberButtonTypeFiveElements];
    [soilButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:soilButton];
    self.soilButton = soilButton;
    [self.soilButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fireButton);
        make.left.equalTo(self.fireButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
}

- (void)setupColorWaveButton  {
    
    
    UIView *line3 = [[UIView alloc]init];
    line3.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line3];
    self.line3 = line3;
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.samallDoubleButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    NSArray *redWaveNumbers = @[@"01",@"02",@"07",@"08",@"12",@"13",@"18",@"19",@"23",@"24",@"29",@"30",@"34",@"35",@"40",@"45",@"46"];
    TBPickNumberButton *reaWaveButton = [[TBPickNumberButton alloc]initWithTitle:@"红波" forNumbers:redWaveNumbers type:PickNumberButtonTypeFiveElements];
    [reaWaveButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:reaWaveButton];
    self.reaWaveButton = reaWaveButton;
    [self.reaWaveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line3.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.samallDoubleButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *blueWaveNumbers = @[@"13",@"14",@"21",@"22",@"29",@"30",@"43",@"44"];
    TBPickNumberButton *blueWaveButton = [[TBPickNumberButton alloc]initWithTitle:@"蓝波" forNumbers:blueWaveNumbers type:PickNumberButtonTypeColorWave];
    [blueWaveButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:blueWaveButton];
    self.blueWaveButton = blueWaveButton;
    [self.blueWaveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reaWaveButton);
        make.left.equalTo(self.reaWaveButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *greenWaveNumbers = @[@"05",@"06",@"11",@"16",@"17",@"21",@"22",@"27",@"28",@"32",@"33",@"38",@"39",@"43",@"44",@"49"];
    TBPickNumberButton *greenWaveButton = [[TBPickNumberButton alloc]initWithTitle:@"绿波" forNumbers:greenWaveNumbers type:PickNumberButtonTypeColorWave];
    [greenWaveButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:greenWaveButton];
    self.greenWaveButton = greenWaveButton;
    [self.greenWaveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blueWaveButton);
        make.left.equalTo(self.blueWaveButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
}

- (void)setupAnimalButton {
    
    
    
    NSArray *fowleNumbers = @[@"01",@"02",@"03",@"05",@"06",@"11",@"13",@"14",@"15",@"17",@"18",@"23",@"25",@"26",@"27",@"29",@"30",@"35",@"37",@"38",@"39",@"41",@"42",@"47",@"49"];
    TBPickNumberButton *fowlButton = [[TBPickNumberButton alloc]initWithTitle:@"家禽" forNumbers:fowleNumbers type:PickNumberButtonTypeAnimal];
    [fowlButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:fowlButton];
    self.fowlButton = fowlButton;
    [self.fowlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line3.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.fireButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *beastNumbers = @[@"04",@"07",@"08",@"09",@"10",@"12",@"16",@"19",@"21",@"22",@"24",@"28",@"31",@"32",@"33",@"34",@"36",@"40",@"43",@"44",@"45",@"46",@"48"];
    TBPickNumberButton *beastButton = [[TBPickNumberButton alloc]initWithTitle:@"野兽" forNumbers:beastNumbers type:PickNumberButtonTypeAnimal];
    [beastButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:beastButton];
    self.beastButton = beastButton;
    [self.beastButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fowlButton);
        make.left.equalTo(self.fowlButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
}

- (void)setupColorSingleAndColorDouble {
    
    
    UIView *line4 = [[UIView alloc]init];
    line4.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line4];
    self.line4 = line4;
    [self.line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reaWaveButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    
    UIView *line5 = [[UIView alloc]init];
    line5.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line5];
    self.line5 = line5;
    [self.line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line1.bottom);
        make.bottom.equalTo(self.line4.top);
        make.width.equalTo(0.5);
        make.centerX.equalTo(self.target.view);
        
    }];
    
    
    NSArray *redSingleNumbers = @[@"01",@"07",@"13",@"19",@"23",@"29",@"35",@"45"];
    TBPickNumberButton *redSingleButton = [[TBPickNumberButton alloc]initWithTitle:@"红单" forNumbers:redSingleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [redSingleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:redSingleButton];
    self.redSingleButton = redSingleButton;
    [self.redSingleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line4.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.reaWaveButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *redDoubleNumbers = @[@"02",@"08",@"12",@"18",@"24",@"30",@"34",@"40",@"46"];
    TBPickNumberButton *redDoubleButton = [[TBPickNumberButton alloc]initWithTitle:@"红双" forNumbers:redDoubleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [redDoubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:redDoubleButton];
    self.redDoubleButton = redDoubleButton;
    [self.redDoubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redSingleButton);
        make.left.equalTo(self.redSingleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
    }];
    
    
    NSArray *blueSingleNumbers = @[@"03",@"09",@"15",@"25",@"31",@"37",@"41",@"47"];
    TBPickNumberButton *blueSingleButton = [[TBPickNumberButton alloc]initWithTitle:@"蓝单" forNumbers:blueSingleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [blueSingleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:blueSingleButton];
    self.blueSingleButton = blueSingleButton;
    [self.blueSingleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redDoubleButton);
        make.left.equalTo(self.redDoubleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *blueDoubleNumbers = @[@"04",@"10",@"14",@"20",@"26",@"36",@"42",@"48"];
    TBPickNumberButton *blueDoubleButton = [[TBPickNumberButton alloc]initWithTitle:@"蓝双" forNumbers:blueDoubleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [blueDoubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:blueDoubleButton];
    self.blueDoubleButton = blueDoubleButton;
    [self.blueDoubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blueSingleButton);
        make.left.equalTo(self.blueSingleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *greenSingleNumbers = @[@"05",@"11",@"13",@"19",@"23",@"29",@"35",@"45"];
    TBPickNumberButton *greenSingleButton = [[TBPickNumberButton alloc]initWithTitle:@"绿单" forNumbers:greenSingleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [greenSingleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:greenSingleButton];
    self.greenSingleButton = greenSingleButton;
    [self.greenSingleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blueDoubleButton);
        make.left.equalTo(self.blueDoubleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *greenDoubleNumbers = @[@"06",@"16",@"22",@"28",@"32",@"38",@"44"];
    TBPickNumberButton *greenDoubleButton = [[TBPickNumberButton alloc]initWithTitle:@"绿双" forNumbers:greenDoubleNumbers type:PickNumberButtonTypeColorWaveAndSingle];
    [greenDoubleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:greenDoubleButton];
    self.greenDoubleButton = greenDoubleButton;
    [self.greenDoubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.greenSingleButton);
        make.left.equalTo(self.greenSingleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
   
    
}

- (void)setupZodiacButton {
    
    UIView *line6 = [[UIView alloc]init];
    line6.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line6];
    self.line6 = line6;
    [self.line6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redSingleButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    NSArray *mouseNumbers = @[@"12",@"24",@"36",@"48"];
    TBPickNumberButton *mouseButton = [[TBPickNumberButton alloc]initWithTitle:@"鼠" forNumbers:mouseNumbers type:PickNumberButtonTypeZodiac];
    [mouseButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:mouseButton];
    self.mouseButton = mouseButton;
    [self.mouseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line6.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.redSingleButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *cattleNumbers = @[@"11",@"23",@"35",@"47"];
    TBPickNumberButton *cattleButton = [[TBPickNumberButton alloc]initWithTitle:@"牛" forNumbers:cattleNumbers type:PickNumberButtonTypeZodiac];
    [cattleButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:cattleButton];
    self.cattleButton = cattleButton;
    [self.cattleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mouseButton);
        make.left.equalTo(self.mouseButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
    }];
    
    NSArray *tigerNumbers = @[@"10",@"22",@"34",@"46"];
    TBPickNumberButton *tigerButton = [[TBPickNumberButton alloc]initWithTitle:@"虎" forNumbers:tigerNumbers type:PickNumberButtonTypeZodiac];
    [tigerButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:tigerButton];
    self.tigerButton = tigerButton;
    [self.tigerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cattleButton);
        make.left.equalTo(self.cattleButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *hareNumbers = @[@"09",@"21",@"33",@"45"];
    TBPickNumberButton *hareButton = [[TBPickNumberButton alloc]initWithTitle:@"兔" forNumbers:hareNumbers type:PickNumberButtonTypeZodiac];
    [hareButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:hareButton];
    self.hareButton = hareButton;
    [self.hareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tigerButton);
        make.left.equalTo(self.tigerButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *dragonNumbers = @[@"08",@"20",@"32",@"44"];
    TBPickNumberButton *dragonButton = [[TBPickNumberButton alloc]initWithTitle:@"龙" forNumbers:dragonNumbers type:PickNumberButtonTypeZodiac];
    [dragonButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:dragonButton];
    self.dragonButton = dragonButton;
    [self.dragonButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hareButton);
        make.left.equalTo(self.hareButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *serpentNumbers = @[@"07",@"19",@"31",@"43"];
    TBPickNumberButton *serpentButton = [[TBPickNumberButton alloc]initWithTitle:@"蛇" forNumbers:serpentNumbers type:PickNumberButtonTypeZodiac];
    [serpentButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:serpentButton];
    self.serpentButton = serpentButton;
    [self.serpentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dragonButton);
        make.left.equalTo(self.dragonButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *horseNumbers = @[@"06",@"18",@"30",@"42"];
    TBPickNumberButton *horseButton = [[TBPickNumberButton alloc]initWithTitle:@"马" forNumbers:horseNumbers type:PickNumberButtonTypeZodiac];
    [horseButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:horseButton];
    self.horseButton = horseButton;
    [self.horseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mouseButton.bottom).offset(self.BtnMargin);
        make.left.equalTo(self.mouseButton);
        make.size.equalTo(self.BtnSize);
    }];
    
    
    NSArray *sheepNumbers = @[@"05",@"17",@"29",@"41"];
    TBPickNumberButton *sheepButton = [[TBPickNumberButton alloc]initWithTitle:@"羊" forNumbers:sheepNumbers type:PickNumberButtonTypeZodiac];
    [sheepButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:sheepButton];
    self.sheepButton = sheepButton;
    [self.sheepButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horseButton);
        make.left.equalTo(self.horseButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];

    NSArray *monkeyNumbers = @[@"04",@"16",@"28",@"40"];
    TBPickNumberButton *monkeyButton = [[TBPickNumberButton alloc]initWithTitle:@"猴" forNumbers:monkeyNumbers type:PickNumberButtonTypeZodiac];
    [monkeyButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:monkeyButton];
    self.monkeyButton = monkeyButton;
    [self.monkeyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sheepButton);
        make.left.equalTo(self.sheepButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];
//

    NSArray *chickenNumbers = @[@"03",@"15",@"27",@"39"];
    TBPickNumberButton *chickenButton = [[TBPickNumberButton alloc]initWithTitle:@"鸡" forNumbers:chickenNumbers type:PickNumberButtonTypeZodiac];
    [chickenButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:chickenButton];
    self.chickenButton = chickenButton;
    [self.chickenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.monkeyButton);
        make.left.equalTo(self.monkeyButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];

    NSArray *dogNumbers = @[@"02",@"14",@"26",@"38"];
    TBPickNumberButton *dogButton = [[TBPickNumberButton alloc]initWithTitle:@"狗" forNumbers:dogNumbers type:PickNumberButtonTypeZodiac];
    [dogButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:dogButton];
    self.dogButton = dogButton;
    [self.dogButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chickenButton);
        make.left.equalTo(self.chickenButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];


    NSArray *pigNumbers = @[@"01",@"13",@"25",@"27",@"49"];
    TBPickNumberButton *pigButton = [[TBPickNumberButton alloc]initWithTitle:@"猪" forNumbers:pigNumbers type:PickNumberButtonTypeZodiac];
    [pigButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:pigButton];
    self.pigButton = pigButton;
    [self.pigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dogButton);
        make.left.equalTo(self.dogButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);

    }];
    
}


- (void)setupMantissaButton {
    
    
    UIView *line7 = [[UIView alloc]init];
    line7.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line7];
    self.line7 = line7;
    [self.line7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horseButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    NSArray *zeroMantissaNumbers = @[@"10",@"20",@"30",@"40"];
    TBPickNumberButton *zeroMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"0尾" forNumbers:zeroMantissaNumbers type:PickNumberButtonTypeZodiac];
    [zeroMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:zeroMantissaButton];
    self.zeroMantissaButton = zeroMantissaButton;
    [self.zeroMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line7.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.horseButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *oneMantissaNumbers = @[@"01",@"11",@"21",@"31",@"41"];
    TBPickNumberButton *oneMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"1尾" forNumbers:oneMantissaNumbers type:PickNumberButtonTypeZodiac];
    [oneMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:oneMantissaButton];
    self.oneMantissaButton = oneMantissaButton;
    [self.oneMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zeroMantissaButton);
        make.left.equalTo(self.zeroMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *twoMantissaNumbers = @[@"02",@"12",@"22",@"32",@"42"];
    TBPickNumberButton *twoMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"2尾" forNumbers:twoMantissaNumbers type:PickNumberButtonTypeZodiac];
    [twoMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:twoMantissaButton];
    self.twoMantissaButton = twoMantissaButton;
    [self.twoMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneMantissaButton);
        make.left.equalTo(self.oneMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *threeMantissaNumbers = @[@"03",@"13",@"23",@"33",@"43"];
    TBPickNumberButton *threeMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"3尾" forNumbers:threeMantissaNumbers type:PickNumberButtonTypeZodiac];
    [threeMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:threeMantissaButton];
    self.threeMantissaButton = threeMantissaButton;
    [self.threeMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoMantissaButton);
        make.left.equalTo(self.twoMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *fourMantissaNumbers = @[@"04",@"14",@"24",@"34",@"44"];
    TBPickNumberButton *fourMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"4尾" forNumbers:fourMantissaNumbers type:PickNumberButtonTypeZodiac];
    [fourMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:fourMantissaButton];
    self.fourMantissaButton = fourMantissaButton;
    [self.fourMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeMantissaButton);
        make.left.equalTo(self.threeMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *fiveMantissaNumbers = @[@"05",@"15",@"25",@"35",@"45"];
    TBPickNumberButton *fiveMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"5尾" forNumbers:fiveMantissaNumbers type:PickNumberButtonTypeZodiac];
    [fiveMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:fiveMantissaButton];
    self.fiveMantissaButton = fiveMantissaButton;
    [self.fiveMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourMantissaButton);
        make.left.equalTo(self.fourMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *sixMantissaNumbers = @[@"06",@"16",@"26",@"36",@"46"];
    TBPickNumberButton *sixMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"6尾" forNumbers:sixMantissaNumbers type:PickNumberButtonTypeZodiac];
    [sixMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:sixMantissaButton];
    self.sixMantissaButton = sixMantissaButton;
    [self.sixMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zeroMantissaButton.bottom).offset(self.BtnMargin);
        make.left.equalTo(self.zeroMantissaButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *sevenMantissaNumbers = @[@"07",@"17",@"27",@"37",@"47"];
    TBPickNumberButton *sevenMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"7尾" forNumbers:sevenMantissaNumbers type:PickNumberButtonTypeZodiac];
    [sevenMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:sevenMantissaButton];
    self.sevenMantissaButton = sevenMantissaButton;
    [self.sevenMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixMantissaButton);
        make.left.equalTo(self.sixMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *eightMantissaNumbers = @[@"08",@"18",@"28",@"38",@"48"];
    TBPickNumberButton *eightMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"8尾" forNumbers:eightMantissaNumbers type:PickNumberButtonTypeZodiac];
    [eightMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:eightMantissaButton];
    self.eightMantissaButton = eightMantissaButton;
    [self.eightMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sevenMantissaButton);
        make.left.equalTo(self.sevenMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *nineMantissaNumbers = @[@"09",@"19",@"29",@"39",@"49"];
    TBPickNumberButton *nineMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"9尾" forNumbers:nineMantissaNumbers type:PickNumberButtonTypeZodiac];
    [nineMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:nineMantissaButton];
    self.nineMantissaButton = nineMantissaButton;
    [self.nineMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.eightMantissaButton);
        make.left.equalTo(self.eightMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
    NSArray *bigMantissaNumbers = @[@"05",@"06",@"07",@"08",@"09",@"15",@"16",@"17",@"18",@"19",@"25",@"26",@"27",@"28",@"29",@"35",@"36",@"37",@"38",@"39",@"45",@"46",@"47",@"48",@"49"];
    TBPickNumberButton *bigMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"9尾" forNumbers:bigMantissaNumbers type:PickNumberButtonTypeZodiac];
    [bigMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:bigMantissaButton];
    self.bigMantissaButton = bigMantissaButton;
    [self.bigMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nineMantissaButton);
        make.left.equalTo(self.nineMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *smallMantissaNumbers = @[@"01",@"02",@"03",@"04",@"10",@"11",@"12",@"13",@"14",@"20",@"21",@"22",@"23",@"24",@"30",@"31",@"32",@"33",@"34",@"40",@"41",@"42",@"43",@"44",@"49",@"49",@"49",@"49",@"49",@"49",@"49",@"49",@"49",@"49"];
    TBPickNumberButton *smallMantissaButton = [[TBPickNumberButton alloc]initWithTitle:@"9尾" forNumbers:smallMantissaNumbers type:PickNumberButtonTypeZodiac];
    [smallMantissaButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:smallMantissaButton];
    self.smallMantissaButton = smallMantissaButton;
    [self.smallMantissaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigMantissaButton);
        make.left.equalTo(self.bigMantissaButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    
}

- (void)setupHeadCountButton {
    
    
    UIView *line8 = [[UIView alloc]init];
    line8.backgroundColor = [UIColor lightGrayColor];
    [self.target.view addSubview:line8];
    self.line8 = line8;
    [self.line8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sixMantissaButton.bottom).offset(self.BtnSpace);
        make.left.right.equalTo(self.target.view);
        make.height.equalTo(0.5);
    }];
    
    NSArray *zeroHeadNumbers = @[@"01",@"02",@"03",@"04"];
    TBPickNumberButton *zeroHeadButton = [[TBPickNumberButton alloc]initWithTitle:@"0头" forNumbers:zeroHeadNumbers type:PickNumberButtonTypeZodiac];
    [zeroHeadButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:zeroHeadButton];
    self.zeroHeadButton = zeroHeadButton;
    [self.zeroHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line8.bottom).offset(self.BtnSpace);
        make.left.equalTo(self.sixMantissaButton);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *oneHeadNumbers = @[@"11",@"12",@"13",@"14"];
    TBPickNumberButton *oneHeadButton = [[TBPickNumberButton alloc]initWithTitle:@"1头" forNumbers:oneHeadNumbers type:PickNumberButtonTypeZodiac];
    [oneHeadButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:oneHeadButton];
    self.oneHeadButton = oneHeadButton;
    [self.oneHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zeroHeadButton);
        make.left.equalTo(self.zeroHeadButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *twoHeadNumbers = @[@"20",@"21",@"22",@"23",@"24"];
    TBPickNumberButton *twoHeadButton = [[TBPickNumberButton alloc]initWithTitle:@"2头" forNumbers:twoHeadNumbers type:PickNumberButtonTypeZodiac];
    [twoHeadButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:twoHeadButton];
    self.twoHeadButton = twoHeadButton;
    [self.twoHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneHeadButton);
        make.left.equalTo(self.oneHeadButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *threeHeadNumbers = @[@"30",@"31",@"32",@"33",@"34"];
    TBPickNumberButton *threeHeadButton = [[TBPickNumberButton alloc]initWithTitle:@"3头" forNumbers:threeHeadNumbers type:PickNumberButtonTypeZodiac];
    [threeHeadButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:threeHeadButton];
    self.threeHeadButton = threeHeadButton;
    [self.threeHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoHeadButton);
        make.left.equalTo(self.twoHeadButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
    NSArray *fourHeadNumbers = @[@"40",@"41",@"42",@"43",@"44"];
    TBPickNumberButton *fourHeadButton = [[TBPickNumberButton alloc]initWithTitle:@"4头" forNumbers:fourHeadNumbers type:PickNumberButtonTypeZodiac];
    [fourHeadButton addTarget:self action:@selector(pickNumberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:fourHeadButton];
    self.fourHeadButton = fourHeadButton;
    [self.fourHeadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeHeadButton);
        make.left.equalTo(self.threeHeadButton.right).offset(self.BtnSpace);
        make.size.equalTo(self.BtnSize);
        
    }];
    
}
- (void)pickNumberButtonClick:(TBPickNumberButton *)btn {
    
    if (btn.type == PickNumberButtonTypeSingleAndDouble) {
        
        if (![self.selectSingleOrDoubleButton isEqual:btn]) {
            self.selectSingleOrDoubleButton.selected = NO;
            self.selectSingleOrDoubleButton = btn;
        }
        
    }
    
    if (btn.type == PickNumberButtonTypeBigAndSmall) {
        
        if (![self.selectBigOrSmallButton isEqual:btn]) {
            self.selectBigOrSmallButton.selected = NO;
            self.selectBigOrSmallButton = btn;
        }
       
    }
    
    if (btn.type == PickNumberButtonTypeAnimal) {
        
        if (![self.selectAnimalButton isEqual:btn]) {
            self.selectAnimalButton.selected = NO;
            self.selectAnimalButton = btn;
        }
       
    }
    

    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.displayCodesView addPickNumberButton:btn];
    } else {
        [self.displayCodesView removePickNumberButton:btn];
    }
    
    
    
}

- (void)setupAssociate {
    
    
}


@end
