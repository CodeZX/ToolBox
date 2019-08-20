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


@interface TBDisplayCodesView ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) NSMutableArray *singleAnddDoubleArray;
@property (nonatomic,strong) NSMutableArray *bigAnddSmallArray;
@property (nonatomic,strong) NSMutableArray *bigSmallAnddBigDoubleArray;
@property (nonatomic,strong) NSMutableArray *fiveElementsArray;
@property (nonatomic,strong) NSMutableArray *colorWaveArray;
@property (nonatomic,strong) NSMutableArray *colorWaveAndSingleArray;
@property (nonatomic,strong) NSMutableArray *animalArray;
@property (nonatomic,strong) NSMutableArray *zodiacArray;
@property (nonatomic,strong) NSMutableArray *mantissaArray;
@property (nonatomic,strong) NSMutableArray *headCountArray;

@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *numberArray;
@end

static NSString  * const cellIdentifier = @"TBDisplayCodesViewCell";
@implementation TBDisplayCodesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       
        [self setupUI];
    }

    return self;
}

- (void)setupUI {
    
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(25, 25);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [collectionView registerClass:[TBDisplayCodesViewCell class] forCellWithReuseIdentifier:cellIdentifier];
}

- (void)addPickNumberButton:(TBPickNumberButton *)btn {
 
    switch (btn.type) {
        case PickNumberButtonTypeSingleAndDouble:
            [self.singleAnddDoubleArray removeAllObjects];
            [self.singleAnddDoubleArray addObject:btn];
            break;
        case PickNumberButtonTypeBigAndSmall:
            [self.bigAnddSmallArray removeAllObjects];
            [self.bigAnddSmallArray addObject:btn];
            break;
        case PickNumberButtonTypeBigSingleAndBigDouble:
            if (![self.bigSmallAnddBigDoubleArray containsObject:btn]) {
                [self.bigSmallAnddBigDoubleArray addObject:btn];
            }
            break;
        case PickNumberButtonTypeColorWave:
            if (![self.colorWaveArray containsObject:btn]) {
                [self.colorWaveArray addObject:btn];
            }
            break;
        case PickNumberButtonTypeColorWaveAndSingle:
            if (![self.colorWaveAndSingleArray containsObject:btn]) {
                [self.colorWaveAndSingleArray addObject:btn];
            }
            break;
        case PickNumberButtonTypeZodiac:
            if (![self.zodiacArray containsObject:btn]) {
                [self.zodiacArray addObject:btn];
            }
            break;
        case PickNumberButtonTypeMantissa:
            if (![self.mantissaArray containsObject:btn]) {
                [self.mantissaArray addObject:btn];
            }
            break;
        
        case PickNumberButtonTypeFiveElements:
            if (![self.fiveElementsArray containsObject:btn]) {
                [self.fiveElementsArray addObject:btn];
            }
            break;
        case PickNumberButtonTypeAnimal:
            [self.animalArray removeAllObjects];
            [self.animalArray addObject:btn];
           
            break;
        case PickNumberButtonTypeHeadCount:
            if (![self.headCountArray containsObject:btn]) {
                [self.headCountArray addObject:btn];
            }
            
            break;
        default:
            break;
    }
    
       
        [self createNumberBall];
    
 
   
}


- (void)removePickNumberButton:(TBPickNumberButton *)btn {
    
    switch (btn.type) {
        case PickNumberButtonTypeSingleAndDouble:
            [self.singleAnddDoubleArray removeAllObjects];
           
            break;
        case PickNumberButtonTypeBigAndSmall:
            [self.bigAnddSmallArray removeAllObjects];
          
            break;
        case PickNumberButtonTypeBigSingleAndBigDouble:
            if ([self.bigSmallAnddBigDoubleArray containsObject:btn]) {
                [self.bigSmallAnddBigDoubleArray removeObject:btn];
            }
            break;
        case PickNumberButtonTypeColorWave:
            if ([self.colorWaveArray containsObject:btn]) {
                [self.colorWaveArray removeObject:btn];
            }
            break;
        case PickNumberButtonTypeColorWaveAndSingle:
            if ([self.colorWaveAndSingleArray containsObject:btn]) {
                [self.colorWaveAndSingleArray removeObject:btn];
            }
            break;
        case PickNumberButtonTypeZodiac:
            if ([self.zodiacArray containsObject:btn]) {
                [self.zodiacArray removeObject:btn];
            }
            break;
        case PickNumberButtonTypeMantissa:
            if ([self.mantissaArray containsObject:btn]) {
                [self.mantissaArray removeObject:btn];
            }
            break;
            
        case PickNumberButtonTypeFiveElements:
            if ([self.fiveElementsArray containsObject:btn]) {
                [self.fiveElementsArray removeObject:btn];
            }
            break;
        case PickNumberButtonTypeAnimal:
            [self.animalArray removeAllObjects];
            break;
        case PickNumberButtonTypeHeadCount:
            if ([self.headCountArray containsObject:btn]) {
                [self.headCountArray removeObject:btn];
            }
            
            break;
        default:
            break;
    }
    
    
    [self createNumberBall];
    
    
}


- (void)createNumberBall {
    
    [self.numberArray removeAllObjects];
    
    
    NSMutableArray *numberArray = [[NSMutableArray alloc]init];
   
    NSArray *numberSingleAnddDoubleArray =  [self numberArrayForPickButtonArray:self.singleAnddDoubleArray];
    if (numberSingleAnddDoubleArray.count != 0) {
        [numberArray addObject:numberSingleAnddDoubleArray];
    }

    
    NSArray *numberBigAnddSmallArray = [self numberArrayForPickButtonArray:self.bigAnddSmallArray];
    if (numberBigAnddSmallArray.count != 0) {
        [numberArray addObject:numberBigAnddSmallArray];
    }
   
    NSArray *numberAnimalArray = [self numberArrayForPickButtonArray:self.animalArray];
    if (numberAnimalArray.count != 0) {
        [numberArray addObject:numberAnimalArray];
    }
   

    NSArray *numberBigSmallAnddBigDoubleArray  = [self unionForPickButtonArray:self.bigSmallAnddBigDoubleArray];
    if (numberBigSmallAnddBigDoubleArray.count != 0) {
        [numberArray addObject:numberBigSmallAnddBigDoubleArray];
    }
   
    
    NSArray *numberFiveElementsArray = [self unionForPickButtonArray:self.fiveElementsArray];
    if (numberFiveElementsArray.count != 0) {
        [numberArray addObject:numberFiveElementsArray];
    }
   
   
    NSArray *numberColorWaveArray  = [self unionForPickButtonArray:self.colorWaveArray];
    if (numberColorWaveArray.count != 0) {
        [numberArray addObject:numberColorWaveArray];
    }
   
   
    NSArray *numberColorWaveAndSingleArray =  [self unionForPickButtonArray:self.colorWaveAndSingleArray];
    if (numberColorWaveAndSingleArray.count != 0) {
        [numberArray addObject:numberColorWaveAndSingleArray];
    }
    
   
    NSArray *numberZodiacArray =  [self unionForPickButtonArray:self.zodiacArray];
    if (numberZodiacArray.count != 0) {
        [numberArray addObject:numberZodiacArray];
    }
    
    
    NSArray *numberMantissaArray  =   [self unionForPickButtonArray:self.mantissaArray];
    if (numberMantissaArray.count != 0) {
        [numberArray addObject:numberMantissaArray];
    }
  
    
    NSArray *numberHeadCountArray =  [self unionForPickButtonArray:self.headCountArray];
    if (numberHeadCountArray.count != 0) {
        [numberArray addObject:numberHeadCountArray];
    }
    
    
   

    self.numberArray = [NSMutableArray arrayWithArray:[self intersectForArray:numberArray]];
    [self.collectionView reloadData];
    
}

- (NSArray *)numberArrayForPickButtonArray:(NSArray<TBPickNumberButton *> *)array {
    
    NSArray *numberArray = [[NSArray alloc]init];
    for (TBPickNumberButton  *btn in array) {
        numberArray = [numberArray arrayByAddingObjectsFromArray:btn.numbers];
    }
    return numberArray;
}

- (NSArray *)intersectForArray:(NSArray *)array {
    
    if (array.count == 1) {
        return [array firstObject];
    } else {
        NSArray *resultArray = [array firstObject];
        for (NSArray *numberArray in array) {
            NSMutableSet *set1 = [NSMutableSet setWithArray:resultArray];
            NSMutableSet *set2 = [NSMutableSet setWithArray:numberArray];
            [set1 intersectSet:set2];
            NSArray *sortArray = @[[[NSSortDescriptor alloc]initWithKey:nil ascending:YES selector:@selector(localizedStandardCompare:)]];
            resultArray = [set1 sortedArrayUsingDescriptors:sortArray];
        }
        return resultArray;
    }
   
}

- (NSArray *)unionForPickButtonArray:(NSMutableArray<TBPickNumberButton *> *)array {
    
    NSArray *numberArray  = [[NSArray alloc]init];
    for (TBPickNumberButton *pickNumberBtn in array) {
        NSMutableSet *set1 = [NSMutableSet setWithArray:numberArray];
        NSMutableSet *set2 = [NSMutableSet setWithArray:pickNumberBtn.numbers];
        [set1 unionSet:set2];
        NSArray *sortArray = @[[[NSSortDescriptor alloc]initWithKey:nil ascending:YES selector:@selector(localizedStandardCompare:)]];
        numberArray = [set1 sortedArrayUsingDescriptors:sortArray];
    }
    return numberArray;
}

- (void)clearResult {
    
    [self.singleAnddDoubleArray removeAllObjects];
    [self.bigAnddSmallArray removeAllObjects];
    [self.bigSmallAnddBigDoubleArray removeAllObjects];
    [self.fiveElementsArray removeAllObjects];
    [self.colorWaveArray removeAllObjects];
    [self.colorWaveAndSingleArray removeAllObjects];
    [self.animalArray removeAllObjects];
    [self.zodiacArray removeAllObjects];
    [self.mantissaArray removeAllObjects];
    [self.headCountArray removeAllObjects];
    
    [self.numberArray removeAllObjects];
    [self.collectionView reloadData];
    
}

- (NSArray *)getResults {
    
    return self.numberArray;
}

#pragma mark -------------------------- collectionView delageate   ----------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.numberArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TBDisplayCodesViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.title = self.numberArray[indexPath.row];
    return cell;
}




#pragma mark -------------------------- lazy laoding ----------------------------------------

- (NSMutableArray *)numberArray {
    if (!_numberArray) {
        _numberArray = [[NSMutableArray alloc]init];
        
    }
    return _numberArray;
}


- (NSMutableArray *)singleAnddDoubleArray {
    if (!_singleAnddDoubleArray) {
        _singleAnddDoubleArray = [[NSMutableArray alloc]init];
    }
    return _singleAnddDoubleArray;
}

- (NSMutableArray *)bigAnddSmallArray {
    if (!_bigAnddSmallArray) {
        _bigAnddSmallArray = [[NSMutableArray alloc]init];
    }
    return _bigAnddSmallArray;
}

- (NSMutableArray *)bigSmallAnddBigDoubleArray {
    if (!_bigSmallAnddBigDoubleArray) {
        _bigSmallAnddBigDoubleArray = [[NSMutableArray alloc]init];
    }
    return _bigSmallAnddBigDoubleArray;
}

- (NSMutableArray *)fiveElementsArray {
    if (!_fiveElementsArray) {
        _fiveElementsArray = [[NSMutableArray alloc]init];
    }
    return _fiveElementsArray;
}


- (NSMutableArray *)colorWaveArray {
    if (!_colorWaveArray) {
        _colorWaveArray = [[NSMutableArray alloc]init];
    }
    return _colorWaveArray;
}


- (NSMutableArray *)colorWaveAndSingleArray {
    if (!_colorWaveAndSingleArray) {
        _colorWaveAndSingleArray = [[NSMutableArray alloc]init];
    }
    return _colorWaveAndSingleArray;
}


- (NSMutableArray *)animalArray {
    if (!_animalArray) {
        _animalArray = [[NSMutableArray alloc]init];
    }
    return _animalArray;
}

- (NSMutableArray *)zodiacArray {
    if (!_zodiacArray) {
        _zodiacArray = [[NSMutableArray alloc]init];
    }
    return _zodiacArray;
}

- (NSMutableArray *)mantissaArray {
    if (!_mantissaArray) {
        _mantissaArray = [[NSMutableArray alloc]init];
    }
    return _mantissaArray;
}


- (NSMutableArray *)headCountArray {
    if (!_headCountArray) {
        _headCountArray = [[NSMutableArray alloc]init];
    }
    return _headCountArray;
}




@end




@interface TBDisplayCodesViewCell ()

@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIImageView *backgroundImageView;


@end

@implementation TBDisplayCodesViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }

    return self;
}


- (void)setupUI {


    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:backgroundImageView];
    self.backgroundImageView = backgroundImageView;
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];

  
    
}

- (void)setTitle:(NSString *)title {
    _title = title;

    self.titleLabel.text = title;
    
    NSArray *redWaveArray = @[@"01",@"02",@"07",@"08",@"12",@"13",@"18",@"19",@"23",@"24",@"29",@"30",@"34",@"35",@"40",@"45",@"46"];
    NSArray *blueWaveArray = @[@"03",@"04",@"09",@"10",@"14",@"15",@"20",@"25",@"26",@"31",@"36",@"37",@"41",@"47",@"48"];
    NSArray *greenWaveArray = @[@"05",@"06",@"11",@"16",@"17",@"21",@"22",@"27",@"28",@"32",@"33",@"38",@"39",@"43",@"44",@"49"];
    
    [redWaveArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if ([string isEqualToString:title]) {
            self.backgroundImageView.image = [UIImage imageNamed:@"ball_red_tool_lover"];
            *stop = YES;
            return ;
        }
    }];
    [blueWaveArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if ([string isEqualToString:title]) {
           self.backgroundImageView.image = [UIImage imageNamed:@"ball_blue_tool_lover"];
            *stop = YES;
            return ;
        }
    }];
    [greenWaveArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if ([string isEqualToString:title]) {
            self.backgroundImageView.image = [UIImage imageNamed:@"ball_green_tool_lover"];
            *stop = YES;
            return ;
        }
    }];

}

@end
