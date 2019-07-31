//
//  TBZodiacCardViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBZodiacCardViewModel.h"
#import "TBBriefIntroductionView.h"
#import "TBZodiacCardCollectionViewCell.h"
#import "TBZodiacCardModel.h"
#import <AudioToolbox/AudioToolbox.h>
//#import ""

@interface TBZodiacCardViewModel   ()

@property (nonatomic,weak) UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *zodiacCardModels;
@property (nonatomic,strong) NSMutableArray *selectZodiacCardModels;
@property (nonatomic,assign,getter=isSelectEnd) BOOL selectEnd;
@property (nonatomic,weak) UILabel *promptLabel;
@end

static NSString * const identifier = @"zodiacCard";
@implementation TBZodiacCardViewModel

- (NSString *)stringForIdentifier {
    return identifier;
}
- (instancetype)initWithTarget:(UIViewController<UICollectionViewDelegate,UICollectionViewDataSource
                                > *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupComponent];
        [self setupSourceData];
        [self setupAssociate];
        
    }
    return self;
}

- (void)setupTarget:(UIViewController<UICollectionViewDelegate,UICollectionViewDataSource> *)target {

    if (target) {
        self.target = target;
    }
    
}

- (void)setupComponent {
    
    TBBriefIntroductionView *briefIntroductionView = [[TBBriefIntroductionView alloc]initWithContentString:@"每期开奖前通过该工具可以快捷的查看三个隐藏在卡牌中的生肖，来试试你的财运！"];
    [self.target.view addSubview:briefIntroductionView];
    self.briefIntroductionView = briefIntroductionView;
    [self.briefIntroductionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.target.view);
        make.top.equalTo(88);
        make.height.equalTo(100);
    }];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing =  0;
    CGFloat itemW = [UIScreen mainScreen].bounds.size.width/3.0;
    CGFloat itemH = itemW / 0.85;
    layout.itemSize = CGSizeMake(itemW,itemH);
    CGRect frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    if (self.target) {
        [self.target.view addSubview:collectionView];
        self.collectionView = collectionView;
        collectionView.delegate = self.target;
        collectionView.dataSource = self.target;
        
        [collectionView registerClass:[TBZodiacCardCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    
    
    UILabel *promptLabel = [[UILabel alloc]init];
    promptLabel.text = @"小提示：每期只能进行一次幸运翻盘！";
    promptLabel.font = [UIFont systemFontOfSize:12];
    [self.target.view addSubview:promptLabel];
    self.promptLabel = promptLabel;
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.target.view).offset(-10);
        make.centerX.equalTo(self.target.view);
    }];
}

- (void)setupSourceData {
    
    TBZodiacCardModel *chickenZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"鸡" picturePath:@"ico_card_chicken"];
     TBZodiacCardModel *cowZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"牛" picturePath:@"ico_card_cow"];
     TBZodiacCardModel *dogZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"狗" picturePath:@"ico_card_dog"];
     TBZodiacCardModel *dragonZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"龙" picturePath:@"ico_card_dragon"];
     TBZodiacCardModel *horseZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"马" picturePath:@"ico_card_horse"];
     TBZodiacCardModel *monkeyZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"猴" picturePath:@"ico_card_monkey"];
     TBZodiacCardModel *mouseZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"鼠" picturePath:@"ico_card_mouse"];
     TBZodiacCardModel *pigZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"猪" picturePath:@"ico_card_pig"];
     TBZodiacCardModel *rabbitZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"兔子" picturePath:@"ico_card_rabbit"];
     TBZodiacCardModel *sheepZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"羊" picturePath:@"ico_card_sheep"];
     TBZodiacCardModel *snakeZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"蛇" picturePath:@"ico_card_snake"];
     TBZodiacCardModel *tigerZodiacCardModel = [[TBZodiacCardModel alloc]initWithZodiac:@"虎" picturePath:@"ico_card_tiger"];
    
    self.zodiacCardModels = @[ chickenZodiacCardModel,cowZodiacCardModel,dogZodiacCardModel,
                          dragonZodiacCardModel,horseZodiacCardModel,monkeyZodiacCardModel,
                          mouseZodiacCardModel,pigZodiacCardModel,rabbitZodiacCardModel,
                          sheepZodiacCardModel,snakeZodiacCardModel,tigerZodiacCardModel];
    
    
}

- (void)setupAssociate {
    
    
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    if (self.selectEnd) {
        return self.selectZodiacCardModels.count;
    }else  {
        return self.zodiacCardModels.count;
    }
}

- (TBZodiacCardModel *)zodiaccardModelForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectEnd) {
        return self.selectZodiacCardModels[indexPath.row];
    }else {
        return self.zodiacCardModels[indexPath.row];
    }
}

- (void)selectItemAtindexPath:(NSIndexPath *)indexPath {
    
    TBZodiacCardModel *zodiacCardModel = self.zodiacCardModels[indexPath.row];
    for (TBZodiacCardModel *model in self.selectZodiacCardModels) {
        if ([model isEqual:zodiacCardModel]) {
            return;
        }
    }
    
    [self.selectZodiacCardModels addObject:zodiacCardModel];
    TBZodiacCardCollectionViewCell *cell = (TBZodiacCardCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    [cell startRotationAnimation:^(BOOL finished) {
        if (finished) {
            if (self.selectZodiacCardModels.count == 3) {
                self.selectEnd = YES;
                [UIView transitionWithView:self.collectionView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [self.collectionView reloadData];
                } completion:^(BOOL finished) {
                    if (finished) {
                        [self performSelector:@selector(sendRotationAllNotification) withObject:nil afterDelay:0];
                        [self playAudioFromFile:@"sound_38"];
                    }
                    
                }];
            }
        }
    }];
    
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


- (void)sendRotationAllNotification {
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"RotationAllNotification" object:nil];
}
- (NSMutableArray *)selectZodiacCardModels
{
    if (!_selectZodiacCardModels) {
        _selectZodiacCardModels = [[NSMutableArray alloc]init];
    }
    return _selectZodiacCardModels;
}

@end
