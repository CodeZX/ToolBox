//
//  TBRandomPickerView.m
//  ToolBox
//
//  Created by 周鑫 on 2019/8/6.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBRandomPickerView.h"




typedef NS_ENUM(NSUInteger, TablewViewTag) {
    TablewViewTagLeft   = 1001,
    TablewViewTagCenter = 1002,
    TablewViewTagRigth  = 1003,
};



@interface TBRandomPickerView  ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,weak) UITableView *leftTableView;
@property (nonatomic,weak) UITableView *centerTableView;
@property (nonatomic,weak) UITableView *rightTableView;
@property (nonatomic,strong) CADisplayLink *disLink;
@property (nonatomic,assign) NSInteger currentRow;
@property (nonatomic,assign) NSInteger rowCount;


@property (nonatomic,strong) NSMutableArray *leftDataArray;
@property (nonatomic,strong) NSMutableArray *centerDataArray;
@property (nonatomic,strong) NSMutableArray *rightDataArray;




@property (nonatomic,assign) CGFloat rowHeight;
@property (nonatomic,assign) CGFloat rowWidth;
@property (nonatomic,assign) NSInteger displayRowCount;






@end




@implementation TBRandomPickerView

- (instancetype)initWithType:(RandomPickerViewType)type {
    self = [super init];
    if (self) {
        self.type = type;
        [self setupData];
        [self setupUI];
    }
    return self;
    
}


- (void)setupData {
    
    self.rowCount = 100;
    self.rowHeight = 60;
    self.rowWidth = 80;
    self.displayRowCount = 3;
    
    if (self.type == RandomPickerViewTypeNumber) {
        
        NSArray *numberArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 9;
            NSString *numberString = numberArray[randomIndex];
            [self.leftDataArray addObject: [numberString copy]];
        }
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 8;
            NSString *numberString = numberArray[randomIndex];
            [self.centerDataArray addObject:[numberString copy]];
        }
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 8;
            NSString *numberString = numberArray[randomIndex];
            [self.rightDataArray addObject:[numberString copy]];
        }
    
    
    
    } else if (self.type == RandomPickerViewTypeZodiac) {
        
        NSArray *zodiacArray = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 12;
            NSString *zodiacString = zodiacArray[randomIndex];
            [self.leftDataArray addObject: [zodiacString copy]];
        }
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 12;
            NSString *zodiacString = zodiacArray[randomIndex];
            [self.centerDataArray addObject:[zodiacString copy]];
        }
        for (int index = 0; index < self.rowCount; index++) {
            NSInteger randomIndex = arc4random() % 12;
            NSString *zodiacString = zodiacArray[randomIndex];
            [self.rightDataArray addObject:[zodiacString copy]];
        }
        
    }
    
   
    
}


- (UITableView *)createTableViewWithTag:(TablewViewTag)tag {
   
    UITableView *tableView = [[UITableView alloc]init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wheel_backgroud.jpg"]];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;  // 不显示分割线
    tableView.showsVerticalScrollIndicator = NO;   // 隐藏滚动条
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tag = tag;
    tableView.userInteractionEnabled = YES;
    [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.rowCount - 20 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    [self addSubview:tableView];
    return tableView;
}


- (void)setupUI {
    
    self.backgroundColor =[UIColor clearColor];
 
    CGFloat interval = ([UIScreen mainScreen].bounds.size.width - 3 * self.rowWidth)/4;
    
//    UIImageView *i  =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wheel_backgroud.jpg"]];
//    i.backgroundColor = [UIColor redColor];
//    [self addSubview:i];
//    [i mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
//        make.height.equalTo(self.rowHeight * self.displayRowCount);
//        make.width.equalTo(self.rowWidth);
//    }];
//
    self.centerTableView = [self createTableViewWithTag:TablewViewTagCenter];
    [self.centerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.equalTo(self.rowHeight * self.displayRowCount);
        make.width.equalTo(self.rowWidth);
    }];
    
   
    
    self.leftTableView = [self createTableViewWithTag:TablewViewTagLeft];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.centerTableView.left).offset(-interval);
        make.centerY.equalTo(self.centerTableView);
        make.size.equalTo(self.centerTableView);
    }];
    


    self.rightTableView = [self createTableViewWithTag:TablewViewTagRigth];
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.centerTableView.right).offset(interval);
        make.centerY.equalTo(self.centerTableView);
        make.size.equalTo(self.centerTableView);
    }];

    

    
    [self performSelector:@selector(startPicker) withObject:self afterDelay:0.5];
}

- (void)startPicker {
    
    // 创建CADisplayLink
    self.disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(pickerAnimation)];
    self.disLink.preferredFramesPerSecond = 8;
    // 添加至RunLoop中
    [self.disLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    //    // 终止定时器
    //    [disLink invalidate];
    //    // 销毁对象
    //    disLink = nil;
}

- (void)pickerAnimation {
    
    static  int currentRow = 80;
    currentRow--;
    if (currentRow > 65) {
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        [self.centerTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        [self.rightTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }else {
        
        NSIndexPath *indexPathForLeft = [self.leftTableView indexPathForSelectedRow];
        NSIndexPath *indexPathForCenter = [self.centerTableView indexPathForSelectedRow];
        NSIndexPath *indexPathForRight = [self.rightTableView indexPathForSelectedRow];
        NSString *resultString = [NSString stringWithFormat:@"%@%@%@",self.leftDataArray[indexPathForLeft.row],self.centerDataArray[indexPathForCenter.row],self.rightDataArray[indexPathForRight.row]];
        if ([self.delegate respondsToSelector:@selector(randomPickerView:randomResult:)]) {
            [self.delegate randomPickerView:self randomResult:resultString];
        }
        
        if ([self.delegate respondsToSelector:@selector(randomPickerView:complete:)]) {
            if (resultString.length != 0) {
                 [self.delegate randomPickerView:self complete:YES];
            }
           
        }

        currentRow = 80;
        [self.disLink invalidate];
        self.disLink = nil;
    }
   

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.leftDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.textLabel.transform = CGAffineTransformMakeScale(1.1, 1.1);
        cell.backgroundColor = [UIColor clearColor];
    }
   
    NSString *titleString;
    switch (tableView.tag ) {
        case TablewViewTagLeft:
            titleString = self.leftDataArray[indexPath.row];
            break;
        case TablewViewTagCenter:
            titleString = self.centerDataArray[indexPath.row];
            break;
        case TablewViewTagRigth:
            titleString = self.rightDataArray[indexPath.row];
            break;
        default:
            break;
    }
    cell.textLabel.text = titleString;
    
    return cell;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.rowHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {


    return self.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return self.rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor orangeColor];
    headerView.alpha = 0;
    return headerView;

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIView *footerView = [[UIView alloc]init];
    footerView.backgroundColor = [UIColor orangeColor];
    footerView.alpha = 0;
    return footerView;

}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    NSArray *leftVisibleCells =  [self.leftTableView visibleCells];
    for (UITableViewCell *cell in leftVisibleCells) {
        CGPoint point =   [self convertPoint:cell.textLabel.center fromView:cell];
        NSInteger offset = fabs(self.frame.size.height/2 -  point.y);
        CGFloat scale = (1 - offset/100.0) + 0.8;
//        NSLog(@"%f",scale);
        cell.textLabel.transform = CGAffineTransformMakeScale( scale,scale);
        
        
    }
    
    NSArray *centerVisibleCells = [self.centerTableView visibleCells];
    for (UITableViewCell *cell in centerVisibleCells) {
        CGPoint point =   [self convertPoint:cell.textLabel.center fromView:cell];
        NSInteger offset = fabs(self.frame.size.height/2 -  point.y);
        CGFloat scale = (1 - offset/100.0) + 0.8;
        
        cell.textLabel.transform = CGAffineTransformMakeScale( scale,scale);
        
        
    }
    
    
    NSArray *rightVisibleCells = [self.rightTableView visibleCells];
    for (UITableViewCell *cell in rightVisibleCells) {
        CGPoint point =   [self convertPoint:cell.textLabel.center fromView:cell];
        NSInteger offset = fabs(self.frame.size.height/2 -  point.y);
        CGFloat scale = (1 - offset/100.0) + 0.8;
        //        NSLog(@"%ld",(long)offset);
        cell.textLabel.transform = CGAffineTransformMakeScale( scale,scale);
        
        
    }

}




- (void)dealloc {
    
    [self.disLink  invalidate];
    self.disLink = nil;
}



- (NSMutableArray *)leftDataArray {
    if (!_leftDataArray) {
        _leftDataArray = [[NSMutableArray alloc]init];
        
    }
    return _leftDataArray;
}

- (NSMutableArray *)centerDataArray {
    if (!_centerDataArray) {
        _centerDataArray = [[NSMutableArray alloc]init];
        
    }
    return _centerDataArray;
}

- (NSMutableArray *)rightDataArray {
    if (!_rightDataArray) {
        _rightDataArray  = [[NSMutableArray alloc]init];
    }
    return _rightDataArray;
}
@end
