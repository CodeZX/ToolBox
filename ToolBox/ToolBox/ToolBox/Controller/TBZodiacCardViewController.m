//
//  TBZodiacCardViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBZodiacCardViewController.h"
#import "TBZodiacCardViewModel.h"
#import "TBZodiacCardCollectionViewCell.h"

@interface TBZodiacCardViewController ()<UICollectionViewDelegate,UICollectionViewDataSource
>
@property (nonatomic,strong) TBZodiacCardViewModel *zodiacCardVM;
@end

@implementation TBZodiacCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.zodiacCardVM = [[TBZodiacCardViewModel alloc]initWithTarget:self];
    // Do any additional setup after loading the view.
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    TBZodiacCardCollectionViewCell *cell = [TBZodiacCardCollectionViewCell cellWithCollectionView:collectionView Identifier:[self.zodiacCardVM stringForIdentifier] forIndexPath:indexPath];
    return cell;
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}



@end
