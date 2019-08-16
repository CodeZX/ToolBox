//
//  TBDisplayCodesView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/8/12.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBDisplayCodesView.h"
#import "TBPickNumberButton.h"
#import "TBBallView.h"


@interface TBDisplayCodesView ()

@property (nonatomic,strong) NSMutableArray *pickNumberButtons;
@end
@implementation TBDisplayCodesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.pickNumberButtons  = [[NSMutableArray alloc]init];
    }

    return self;
}

- (void)addPickNumberButton:(TBPickNumberButton *)btn {
 
    if (![self.pickNumberButtons containsObject:btn]) {
        [self.pickNumberButtons addObject:btn];
        [self createNumberBall];
    }
 
   
}


- (void)removePickNumberButton:(TBPickNumberButton *)btn {
    
    if ([self.pickNumberButtons containsObject:btn]) {
        [self.pickNumberButtons removeObject:btn];
        [self createNumberBall];
    }
    
}


- (void)createNumberBall {
    
    NSArray *numberArray = [[NSArray alloc]init];
    for (TBPickNumberButton *pickNumberBtn in self.pickNumberButtons) {
        NSMutableSet *set1 = [NSMutableSet setWithArray:numberArray];
        NSMutableSet *set2 = [NSMutableSet setWithArray:pickNumberBtn.numbers];
        [set1 unionSet:set2];
        NSArray *sortArray = @[[[NSSortDescriptor alloc]initWithKey:nil ascending:YES selector:@selector(localizedStandardCompare:)]];
        numberArray = [set1 sortedArrayUsingDescriptors:sortArray];
        
    }
    
    
    NSLog(@"numberArray-----%@",numberArray);
    
}
@end
