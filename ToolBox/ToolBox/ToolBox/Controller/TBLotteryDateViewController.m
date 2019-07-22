//
//  TBLotteryDateViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/22.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLotteryDateViewController.h"
#import "TBLotteryDateViewModel.h"

@interface TBLotteryDateViewController ()

@property (nonatomic,strong) TBLotteryDateViewModel *lotteryDateVM;
@end

@implementation TBLotteryDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.lotteryDateVM = [[TBLotteryDateViewModel alloc]initWithTarget:self];
}



@end
