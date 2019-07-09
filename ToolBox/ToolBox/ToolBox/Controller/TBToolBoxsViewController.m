//
//  TBToolBoxsViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/1.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBToolBoxsViewController.h"
#import "TBToolBoxsViewModel.h"
#import "TBToolBoxsCollectionViewCell.h"
#import "TBLoverCodeViewController.h"
#import "TBZodiacCardViewController.h"
#import "TBShakeViewController.h"

@interface TBToolBoxsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) TBToolBoxsViewModel *toolBoxsVM;
@end

@implementation TBToolBoxsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.toolBoxsVM = [[TBToolBoxsViewModel alloc]initWithTarget:self];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    TBToolBoxsCollectionViewCell *cell = [TBToolBoxsCollectionViewCell cellWithCollectionView:collectionView Identifier:[self.toolBoxsVM stringForIdentifier] forIndexPath:indexPath];
    return cell;
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController pushViewController:[[TBShakeViewController alloc]init] animated:YES];
}
@end
