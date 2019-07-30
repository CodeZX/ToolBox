//
//  TBEstimateViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/26.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBEstimateViewController.h"
#import "TBEstimateViewModel.h"
@interface TBEstimateViewController ()

@property (nonatomic,strong) TBEstimateViewModel *estimateVM;
@end

@implementation TBEstimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor whiteColor];
    
    self.estimateVM = [[TBEstimateViewModel alloc]initWithTarget:self];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
