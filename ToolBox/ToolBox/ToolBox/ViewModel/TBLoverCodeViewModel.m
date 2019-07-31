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
#import <AudioToolbox/AudioToolbox.h>
#import "TBBallView.h"
@interface TBLoverCodeViewModel ()<UITextFieldDelegate>

@property (nonatomic,weak) UIViewController  *target;
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
@property (nonatomic,strong) UITextField *focusedTextField;



@property (nonatomic,strong) NSMutableArray *ballViewArray;
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
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"请输入您和他/她的生日。计算本期特码，赶紧来试试!"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    UIImageView *sloganImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_tool_lover_bg"]];
    NSArray *jbImageNames = @[[UIImage imageNamed:@"jb1"],[UIImage imageNamed:@"jb2"],[UIImage imageNamed:@"jb3"],[UIImage imageNamed:@"jb4"],[UIImage imageNamed:@"jb5"],[UIImage imageNamed:@"jb6"],[UIImage imageNamed:@"jb7"]];
    [sloganImageView setAnimationImages:jbImageNames];
    [sloganImageView setAnimationDuration:1];
    [sloganImageView setAnimationRepeatCount:3];
    sloganImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.target.view addSubview:sloganImageView];
    self.sloganImageView = sloganImageView;
    [self.sloganImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.briefIntroductionView.bottom).offset(10);
        make.centerX.equalTo(self.target.view);
        make.left.equalTo(self.target.view.left).offset(100);
        make.right.equalTo(self.target.view.right).offset(-100);
        make.height.equalTo(44);
    }];
    

    UILabel *sloganTitleLabel = [[UILabel alloc]init];
    sloganTitleLabel.text = @"来测试一下你们的恋人号码吧！";
    sloganTitleLabel.font = [UIFont systemFontOfSize:18];
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
        make.top.equalTo(self.sloganTitleLabel.bottom).offset(30);
        make.right.equalTo(self.target.view.centerX);
    }];
    
    TBSexSelectButton *manSexSelectButton = [[TBSexSelectButton alloc]init];
    [manSexSelectButton setImage:[UIImage imageNamed:@"btn_tool_lover_man_nopress"] forState:UIControlStateNormal];
    [manSexSelectButton setImage:[UIImage imageNamed:@"btn_tool_lover_man_press"] forState:UIControlStateSelected];
    [manSexSelectButton setTitle:@"男" forState:UIControlStateNormal];
    manSexSelectButton.selected = YES;
    [manSexSelectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    manSexSelectButton.contentMode = UIViewContentModeTopLeft;
    [manSexSelectButton addTarget:self action:@selector(manSexButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.target.view addSubview:manSexSelectButton];
    self.manSexSelectButton = manSexSelectButton;
    [self.manSexSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.sexSelectLabel);
        make.left.equalTo(self.sexSelectLabel.right).offset(10);
    }];
    
    TBSexSelectButton *womanSexSelectButton = [[TBSexSelectButton alloc]init];
    [womanSexSelectButton setImage:[UIImage imageNamed:@"btn_tool_lover_woman_nopress"] forState:UIControlStateNormal];
    [womanSexSelectButton setImage:[UIImage imageNamed:@"btn_tool_lover_woman_press"] forState:UIControlStateSelected];
    [womanSexSelectButton setTitle:@"女" forState:UIControlStateNormal];
    [womanSexSelectButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [womanSexSelectButton addTarget:self action:@selector(womanSexButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
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
        make.top.equalTo(self.sexSelectLabel.bottom).offset(15);
        make.left.equalTo(self.sexSelectLabel);
        
    }];
    
    
    UITextField *oneSelfBirthdaySelectTextField = [[UITextField alloc]init];
    oneSelfBirthdaySelectTextField.placeholder = @"     请选择你的生日     ";
    oneSelfBirthdaySelectTextField.tag = 101;
    oneSelfBirthdaySelectTextField.inputView = self.datePicker;
    oneSelfBirthdaySelectTextField.delegate = self;
    oneSelfBirthdaySelectTextField.layer.borderColor = [UIColor grayColor].CGColor;
    oneSelfBirthdaySelectTextField.layer.borderWidth = .5f;
    oneSelfBirthdaySelectTextField.layer.cornerRadius = 5;
    oneSelfBirthdaySelectTextField.layer.masksToBounds = YES;
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
    fereBirthdaySelectTextField.placeholder = @"      请选择恋人生日     ";
    fereBirthdaySelectTextField.tag = 102;
    fereBirthdaySelectTextField.inputView = self.datePicker;
    fereBirthdaySelectTextField.delegate = self;
    fereBirthdaySelectTextField.layer.borderColor = [UIColor grayColor].CGColor;
    fereBirthdaySelectTextField.layer.borderWidth = .5f;
    fereBirthdaySelectTextField.layer.cornerRadius = 5;
    fereBirthdaySelectTextField.layer.masksToBounds = YES;
    [self.target.view addSubview:fereBirthdaySelectTextField];
    self.fereBirthdaySelectTextField = fereBirthdaySelectTextField;
    [self.fereBirthdaySelectTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fereBirthdaySelectLabel);
        make.left.equalTo(self.fereBirthdaySelectLabel.right).offset(10);
    }];
    
    
    UIButton *matchingButton = [[UIButton alloc]init];
//    [matchingButton setImage:[UIImage imageNamed:@"btn_too_lover_mate_press.9"] forState:UIControlStateNormal];
    matchingButton.layer.cornerRadius = 5;
    matchingButton.layer.masksToBounds = YES;
    matchingButton.backgroundColor = [UIColor redColor];
    [matchingButton setTitle:@"匹配一下" forState:UIControlStateNormal];
    [matchingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [matchingButton addTarget:self action:@selector(matchingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.matchingButton = matchingButton;
    [self.target.view addSubview:matchingButton];
    [self.matchingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fereBirthdaySelectLabel.bottom).offset(30);
        make.centerX.equalTo(self.target.view);
        make.size.equalTo(CGSizeMake(200, 30));
    }];
   
    
    
    for (int index = 0; index < 6; index++) {
        
        TBBallView *ballView = [[TBBallView alloc]init];
        ballView.alpha = 0;
        [self.target.view addSubview:ballView];
        TBBallView *lastBallView = [self.ballViewArray lastObject];
        if (lastBallView) {
            [ballView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastBallView.right).offset(10);
                make.top.equalTo(self.briefIntroductionView.bottom).offset(50);
                make.size.equalTo(CGSizeMake(30, 30));
            }];
        } else {
            [ballView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.target.view.left).offset(70);
                make.top.equalTo(self.briefIntroductionView.bottom).offset(50);
                make.size.equalTo(CGSizeMake(30, 30));
            }];
        }
        [self.ballViewArray addObject:ballView];
    }
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.textColor = [UIColor orangeColor];
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

   
//    [self.manSexSelectButton addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
//    [self.womanSexSelectButton addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
//    [self.oneSelfBirthdaySelectTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
//    [self.fereBirthdaySelectTextField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
   
   
    
    
}
- (void)playAudioFromFile:(NSString *)fileName {
    
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl:音频文件url
     * outSystemSoundID:声音id（此函数会将音效文件加入到系统音频服务中并返回一个长整形ID）
     */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
//    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
    AudioServicesPlaySystemSound(soundID);//播放音效
    //    AudioServicesPlayAlertSound(soundID);//播放音效并震动
    //3.销毁声音
//    AudioServicesDisposeSystemSoundID(soundID);
}
- (void)matchingButtonClick:(UIButton *)snder {
    
   
    if (self.oneSelfBirthdaySelectTextField.text.length <= 0 || self.fereBirthdaySelectTextField.text.length <= 0 ) {

        [SVProgressHUD showErrorWithStatus:@"请选择生日"];
        [SVProgressHUD dismissWithDelay:1.0];
        return;
    }
    
    [self.oneSelfBirthdaySelectTextField resignFirstResponder];
    [self.fereBirthdaySelectTextField resignFirstResponder];
    
    [UIView animateWithDuration:.5 animations:^{
        self.sloganTitleLabel.alpha = 0;
        self.oneSelfbBirthdaySelectLabel.alpha = 0;
        self.oneSelfBirthdaySelectTextField.alpha = 0;
        self.fereBirthdaySelectLabel.alpha = 0;
        self.fereBirthdaySelectTextField.alpha = 0;
        self.sexSelectLabel.alpha = 0;
        self.manSexSelectButton.alpha = 0;
        self.womanSexSelectButton.alpha = 0;
        self.matchingButton.alpha = 0;
    }];
    
    [self.sloganImageView startAnimating];
    [self playAudioFromFile:@"coin"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSMutableArray *randomNumbers = [[NSMutableArray alloc]init];
        for (int index = 0; index < 6; index++) {
            int  randomNumber = random()% 49 + 1;
            BOOL isUse = YES;
            for (NSNumber *number in randomNumbers) {
                if (randomNumber == [number integerValue]) {
                    isUse = NO; break;
                }
            }
            if (isUse) {
                [randomNumbers addObject:@(randomNumber)];
            }
        }
        
        [NSThread sleepForTimeInterval:2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showNumbers:randomNumbers];
            
        });
    });
    
   
    
}

- (void)showNumbers:(NSArray *)numbers {
    
    self.sloganImageView.alpha = 0;
    
    for (int index = 0; index < numbers.count; index++) {
        TBBallView *ballView = self.ballViewArray[index];
        ballView.alpha = 1;
        NSNumber *number = numbers[index];
        ballView.numberString = [NSString stringWithFormat:@"%@",number];
    }
    
    
    
    
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
- (void)manSexButtonClicked:(TBSexSelectButton *)manSexSelectButton {
    
   
    self.womanSexSelectButton.selected = NO;
    self.manSexSelectButton.selected = !manSexSelectButton.selected;
    if (self.manSexSelectButton.selected) {
        self.loverCodeModel.sex = @"男";
    }else {
        self.loverCodeModel.sex = @"";
    }
    
}

- (void)womanSexButtonClicked:(TBSexSelectButton *)womanSexSelectButton {
    
    self.manSexSelectButton.selected = NO;
    self.womanSexSelectButton.selected = !womanSexSelectButton.selected;
    if (self.womanSexSelectButton.selected) {
        self.loverCodeModel.sex = @"女";
    }else {
        self.loverCodeModel.sex = @"";
    }
    
    
    
    
}


#pragma mark -----------------------------------Delegagte ------------------------------------------
//禁止用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.focusedTextField = textField;
}

- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式
    formatter.dateFormat = @"yyyy/MM/dd";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    self.focusedTextField.text = dateStr;
    if (self.focusedTextField.tag == 101) {
        self.loverCodeModel.oneSelfBirthday = self.focusedTextField.text;
    }else if (self.focusedTextField.tag == 102) {
        self.loverCodeModel.fereSelfBirthday = self.focusedTextField.text;
    }
    
   
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



- (NSMutableArray *)ballViewArray {
    if (!_ballViewArray) {
        _ballViewArray = [[NSMutableArray alloc]init];
    }
    return _ballViewArray;
}
@end
