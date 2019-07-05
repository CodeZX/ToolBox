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

@interface TBZodiacCardViewModel   ()

@property (nonatomic,weak) UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *target;
@property (nonatomic,weak) TBBriefIntroductionView *briefIntroductionView;
@property (nonatomic,weak) UICollectionView *collectionView;
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
    
    
}

- (void)setupAssociate {
    
    
}

@end
