//
//  TBKitBagViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBKitBagViewController.h"
#import "TBKitBagViewModel.h"

@interface TBKitBagViewController ()

@property (nonatomic,strong) TBKitBagViewModel *kitBagVM;
@end

@implementation TBKitBagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.kitBagVM = [[TBKitBagViewModel alloc]initWithTarget:self];
    // Do any additional setup after loading the view.
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
