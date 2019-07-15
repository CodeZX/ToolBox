//
//  TBLotteryViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/15.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBLotteryViewController.h"
#import "TBLotteryViewModel.h"

@interface TBLotteryViewController ()
@property (nonatomic,strong) TBLotteryViewModel *lotteryVM;
@end

@implementation TBLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.lotteryVM = [[TBLotteryViewModel alloc]initWithTarget:self];
}




@end
