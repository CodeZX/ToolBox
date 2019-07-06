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

@interface TBZodiacCardViewModel   ()

@property (nonatomic,weak) UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *zodiacCardModels;
@property (nonatomic,strong) NSMutableArray *selectZodiacCardModels;
@property (nonatomic,assign,getter=isSelectEnd) BOOL selectEnd;
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
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3.0, [UIScreen mainScreen].bounds.size.width/3.0);
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
    
    if (self.selectZodiacCardModels.count < 3) {
        [self.selectZodiacCardModels addObject:self.zodiacCardModels[indexPath.row]];
        TBZodiacCardCollectionViewCell *cell = (TBZodiacCardCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        [cell startRotationAnimation:^(BOOL finished) {
            if (finished) {
                if (self.selectZodiacCardModels.count == 3) {
                    self.selectEnd = YES;
                    [NSThread sleepForTimeInterval:0.2];
                    
                    [self.collectionView reloadData];
                }
            }
        }];
        
    }
    
    
    
    
    
}

- (NSMutableArray *)selectZodiacCardModels
{
    if (!_selectZodiacCardModels) {
        _selectZodiacCardModels = [[NSMutableArray alloc]init];
    }
    return _selectZodiacCardModels;
}

@end
