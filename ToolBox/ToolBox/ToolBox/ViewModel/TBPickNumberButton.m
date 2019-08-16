//
//  TBPickNumberButton.m
//  ToolBox
//
//  Created by 周鑫 on 2019/8/13.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBPickNumberButton.h"


@interface TBPickNumberButton ()


@end
@implementation TBPickNumberButton

- (instancetype)initWithTitle:(NSString *)title forNumbers:(NSArray *)numbers type:(PickNumberButtonType)type {
    
    self = [super init];
    if (self) {
        self.numbers = numbers;
        self.type = type;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.contentEdgeInsets = UIEdgeInsetsMake(2, 10, 2, 10);
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateSelected];
        [self setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[self createImageWithColor:[UIColor orangeColor]] forState:UIControlStateSelected];
    }
    
    return self;
}


- (UIImage*)createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



@end
