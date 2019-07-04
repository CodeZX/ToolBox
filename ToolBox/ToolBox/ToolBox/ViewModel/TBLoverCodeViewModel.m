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
#import "TBSexSelectButton.h"
#import "TBBirthdaySelectButton.h"
#import "TBLoverCodeModel.h"
@interface TBLoverCodeViewModel ()<UITextFieldDelegate>

@property (nonatomic,strong) UIViewController  *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UIImageView *sloganImageView;
@property (nonatomic,weak) UILabel *sloganTitleLabel;
@property (nonatomic,weak) UILabel *sexSelectLabel;
@property (nonatomic,weak) TBSexSelectButton *manSexSelectButton;
@property (nonatomic,weak) TBSexSelectButton *womanSexSelectButton;
@property (nonatomic,weak) UILabel *oneSelfbBirthdaySelectLabel;
@property (nonatomic,weak) UILabel *fereBirthdaySelectLabel;
@property (nonatomic,weak) UITextField *oneSelfBirthdaySelectTextField;
@property (nonatomic,weak) UITextField *fereBirthdaySelectTextField;
@property (nonatomic,weak) UIButton *matchingButton;
@property (nonatomic,weak) UILabel *promptLabel;

@property (nonatomic,strong) TBLoverCodeModel *loverCodeModel;
@property (nonatomic,strong) UIDatePicker *datePicker;

@end

static NSString * const identifier = @"loverCode";

@implementation TBLoverCodeViewModel


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
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]init];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    UIImageView *sloganImageView = [[UIImageView alloc]init];
    sloganImageView.backgroundColor = [UIColor redColor];
    [self.target.view addSubview:sloganImageView];
    self.sloganImageView = sloganImageView;
    [self.sloganImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
        make.left.equalTo(self.target.view.left).offset(20);
        make.right.equalTo(self.target.view.right).offset(-20);
        make.height.equalTo(100);
    }];
    

    UILabel *sloganTitleLabel = [[UILabel alloc]init];
    sloganTitleLabel.text = @"来测试一下你们的恋人号码吧！";
    [self.target.view addSubview:sloganTitleLabel];
    self.sloganTitleLabel = sloganTitleLabel;
    [self.sloganTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sloganImageView.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
    }];

    UILabel *sexSelectLabel = [[UILabel alloc]init];
    sexSelectLabel.text = @"请选择您的性别：";
    [self.target.view addSubview:sexSelectLabel];
    self.sexSelectLabel =  sexSelectLabel;
    [self.sexSelectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sloganTitleLabel.bottom).offset(10);
        make.right.equalTo(self.target.view.centerX);
    }];
    
    TBSexSelectButton *manSexSelectButton = [[TBSexSelectButton alloc]init];
    manSexSelectButton.backgroundColor = [UIColor redColor];
    [manSexSelectButton setTitle:@"男" forState:UIControlStateNormal];
    [manSexSelectButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [manSexSelectButton addTarget:self action:@selector(sexButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:manSexSelectButton];
    self.manSexSelectButton = manSexSelectButton;
    [self.manSexSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sexSelectLabel);
        make.left.equalTo(self.sexSelectLabel.right).offset(10);
        
    }];
    
    TBSexSelectButton *womanSexSelectButton = [[TBSexSelectButton alloc]init];
    [womanSexSelectButton setTitle:@"女" forState:UIControlStateNormal];
    [womanSexSelectButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [womanSexSelectButton addTarget:self action:@selector(sexButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    [self.target.view addSubview:womanSexSelectButton];
    self.womanSexSelectButton = womanSexSelectButton;
    [self.womanSexSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.manSexSelectButton);
        make.left.equalTo(self.manSexSelectButton.right).offset(10);
    }];
    
    UILabel *oneSelfbBirthdaySelectLabel = [[UILabel alloc]init];
    oneSelfbBirthdaySelectLabel.text = @"您的生日：";
    [self.target.view addSubview:oneSelfbBirthdaySelectLabel];
    self.oneSelfbBirthdaySelectLabel = oneSelfbBirthdaySelectLabel;
    [self.oneSelfbBirthdaySelectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sexSelectLabel.bottom).offset(10);
        make.left.equalTo(self.sexSelectLabel);
        
    }];
    
    
    UITextField *oneSelfBirthdaySelectTextField = [[UITextField alloc]init];
    oneSelfBirthdaySelectTextField.placeholder = @"请选择你的生日";
    oneSelfBirthdaySelectTextField.inputView = self.datePicker;
    oneSelfBirthdaySelectTextField.delegate = self;
    [self.target.view addSubview:oneSelfBirthdaySelectTextField];
    self.oneSelfBirthdaySelectTextField = oneSelfBirthdaySelectTextField;
    [self.oneSelfBirthdaySelectTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.oneSelfbBirthdaySelectLabel);
        make.left.equalTo(self.oneSelfbBirthdaySelectLabel.right).offset(10);
    }];
    
    
    
    UILabel *fereBirthdaySelectLabel = [[UILabel alloc]init];
    fereBirthdaySelectLabel.text = @"对象生日：";
    [self.target.view addSubview:fereBirthdaySelectLabel];
    self.fereBirthdaySelectLabel = fereBirthdaySelectLabel;
    [self.fereBirthdaySelectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneSelfbBirthdaySelectLabel.bottom).offset(10);
        make.left.equalTo(self.oneSelfbBirthdaySelectLabel);
        
    }];
    
    
    
  
    UITextField *fereBirthdaySelectTextField = [[UITextField alloc]init];
    fereBirthdaySelectTextField.placeholder = @"请选择恋人生日";
    fereBirthdaySelectTextField.inputView = self.datePicker;
    fereBirthdaySelectTextField.delegate = self;
    [self.target.view addSubview:fereBirthdaySelectTextField];
    self.fereBirthdaySelectTextField = fereBirthdaySelectTextField;
    [self.fereBirthdaySelectTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fereBirthdaySelectLabel);
        make.left.equalTo(self.fereBirthdaySelectLabel.right).offset(10);
    }];
    
    
    UIButton *matchingButton = [[UIButton alloc]init];
    [matchingButton setTitle:@"匹配一下" forState:UIControlStateNormal];
    matchingButton.backgroundColor = [UIColor redColor];
    self.matchingButton = matchingButton;
    [self.target.view addSubview:matchingButton];
    [self.matchingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fereBirthdaySelectLabel.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
    }];
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"小提示：每期只能进行一次恋人匹配";
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
}

- (void)setupSourceData {

    self.loverCodeModel = [[ TBLoverCodeModel alloc]init];
    
}

- (void)setupAssociate {

   
    [self.manSexSelectButton addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    [self.womanSexSelectButton addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
    [self.oneSelfBirthdaySelectTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [self.fereBirthdaySelectTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
   
   
    
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"selected"]) {
        
        NSLog(@"zxzxzxzc");
        
    }
    if ([keyPath isEqualToString:@"text"]) {
        
       
        NSLog(@"%@",change[@"kind"]);
        NSLog(@"%@",change[@"new"]);
    }
}

- (NSString *)stringForIdentifier {
    return identifier;
}


#pragma mark ------------------------------------ Means -------------------------------------------
#pragma mark private

#pragma mark public
#pragma mark respond
- (void)sexButtonClicked:(TBSexSelectButton *)sexSelectButton {
    
    sexSelectButton.selected = !sexSelectButton;
    
}


#pragma mark -----------------------------------Delegagte ------------------------------------------
//禁止用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy/MM/dd";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    
    self.oneSelfBirthdaySelectTextField.text = dateStr;
}
#pragma mark ----------------------------------- Network -------------------------------------------
#pragma mark --------------------------------- Lazy loading ----------------------------------------

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        
        //设置地区: zh-中国
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        
        //设置日期模式(Displays month, day, and year depending on the locale setting)
        _datePicker.datePickerMode = UIDatePickerModeDate;
        // 设置当前显示时间
        [_datePicker setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_datePicker setMaximumDate:[NSDate date]];
        
        //设置时间格式
        
        //监听DataPicker的滚动
        [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
        self.datePicker = _datePicker;
        
        
    }
    return _datePicker;
}

@end
