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
#import "TBKitBagViewController.h"
#import "TBLotteryViewController.h"
#import "TBTurntableViewController.h"
#import "TBLotteryDateViewController.h"
#import "TBEstimateViewController.h"
#import "TBToolBoxItemModel.h"
@interface TBToolBoxsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) TBToolBoxsViewModel *toolBoxsVM;
@property (nonatomic,strong) NSMutableArray *itemArray;
@end

@implementation TBToolBoxsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
    
    TBToolBoxItemModel *model1 = [[TBToolBoxItemModel alloc]initWithTitle:@"恋人特码" imageName:@"icon_tool_lover" targetVC:@"TBLoverCodeViewController"];
    TBToolBoxItemModel *model2 = [[TBToolBoxItemModel alloc]initWithTitle:@"生肖卡牌" imageName:@"icon_tool_animals" targetVC:@"TBZodiacCardViewController"];
    TBToolBoxItemModel *model3 = [[TBToolBoxItemModel alloc]initWithTitle:@"摇一摇" imageName:@"icon_tool_rock" targetVC:@"TBShakeViewController"];
    TBToolBoxItemModel *model4 = [[TBToolBoxItemModel alloc]initWithTitle:@"玄机锦囊" imageName:@"icon_tips_night" targetVC:@"TBKitBagViewController"];
    TBToolBoxItemModel *model5 = [[TBToolBoxItemModel alloc]initWithTitle:@"幸运摇奖" imageName:@"icon_tool_ernie" targetVC:@"TBLotteryViewController"];
    TBToolBoxItemModel *model6 = [[TBToolBoxItemModel alloc]initWithTitle:@"波肖转盘" imageName:@"icon_tool_spinning" targetVC:@"TBTurntableViewController"];
    TBToolBoxItemModel *model7 = [[TBToolBoxItemModel alloc]initWithTitle:@"搅珠日期" imageName:@"icon_tool_calendar" targetVC:@"TBLotteryDateViewController"];
    TBToolBoxItemModel *model8 = [[TBToolBoxItemModel alloc]initWithTitle:@"天机测算" imageName:@"icon_tool_abacus" targetVC:@"TBEstimateViewController.h"];
    TBToolBoxItemModel *model9 = [[TBToolBoxItemModel alloc]initWithTitle:@"挑码助手" imageName:@"icon_tool_lover" targetVC:@"TBPickNumberViewController"];
    TBToolBoxItemModel *model10 = [[TBToolBoxItemModel alloc]initWithTitle:@"美女图库" imageName:@"icon_tool_beauty" targetVC:@"TBPickNumberViewController"];
    self.itemArray = [[NSMutableArray alloc]init];
    [self.itemArray addObjectsFromArray:@[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10]];
    
     self.toolBoxsVM = [[TBToolBoxsViewModel alloc]initWithTarget:self];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    TBToolBoxsCollectionViewCell *cell = [TBToolBoxsCollectionViewCell cellWithCollectionView:collectionView Identifier:[self.toolBoxsVM stringForIdentifier] forIndexPath:indexPath];
    cell.itemModel = self.itemArray[indexPath.row];
    return cell;
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TBToolBoxItemModel *model = self.itemArray[indexPath.row];
    UIViewController *targetVC = [[NSClassFromString(model.targetVC) alloc]init];
    [self.navigationController pushViewController:targetVC animated:YES];
}
@end
