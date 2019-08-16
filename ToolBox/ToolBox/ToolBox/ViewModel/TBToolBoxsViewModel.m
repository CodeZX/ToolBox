//
//  TBToolBoxsViewModel.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBToolBoxsViewModel.h"
#import "TBLoverCodeCollectionViewCell.h"
#import "TBToolBoxsCollectionViewCell.h"
@interface TBToolBoxsViewModel ()

@property (nonatomic,strong) UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>  *target;
@property (nonatomic,weak) UICollectionView *collextionView;

@end

static NSString * const identifier = @"loverCode";
@implementation TBToolBoxsViewModel

- (instancetype)initWithTarget:(UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *)target {
    self = [super init];
    if (self) {
        [self setupTarget:target];
        [self setupComponent];
        [self setupSourceData];

    }
    return self;
}


- (void)setupTarget:(UIViewController<UICollectionViewDataSource,UICollectionViewDelegate> *)target {
    
    if (target) {
        self.target = target;
    }
}

- (void)setupComponent {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing =  0;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3.0, [UIScreen mainScreen].bounds.size.width/3.0);
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor lightGrayColor];
    if (self.target) {
        [self.target.view addSubview:collectionView];
        self.collextionView = collectionView;
        collectionView.delegate = self.target;
        collectionView.dataSource = self.target;
        
        [collectionView registerClass:[TBToolBoxsCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    
}

- (void)setupSourceData {
    
    
}


- (NSString *)stringForIdentifier {
    return identifier;
}
@end
