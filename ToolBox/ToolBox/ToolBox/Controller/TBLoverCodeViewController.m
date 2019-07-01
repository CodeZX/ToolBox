//
//  TBLoverCodeViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/6/28.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLoverCodeViewController.h"
#import "TBLoverCodeViewModel.h"
#import "TBLoverCodeCollectionViewCell.h"

@interface TBLoverCodeViewController ()

@property (nonatomic,strong) TBLoverCodeViewModel *loverCodeVM;

@end

@implementation TBLoverCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"恋人特码";
    
    self.loverCodeVM = [[TBLoverCodeViewModel alloc]initWithTarget:self];
}









@end
