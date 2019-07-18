//
//  TBTurntableViewController.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/17.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBTurntableViewController.h"
#import "TBTurntableView.h"
#import "TBTurntableViewModel.h"
@interface TBTurntableViewController ()
@property (nonatomic,strong) TBTurntableViewModel *turntableVM;
@end

@implementation TBTurntableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.turntableVM = [[TBTurntableViewModel alloc]initWithTarget:self];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self.turntableVM startAnimation];
}


@end
