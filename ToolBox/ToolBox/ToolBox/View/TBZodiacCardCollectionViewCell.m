//
//  TBZodiacCardCollectionViewCell.m
//  ToolBox
//
//  Created by 周鑫 on 2019/7/5.
//  Copyright © 2019 ZX. All rights reserved.
//

#import "TBZodiacCardCollectionViewCell.h"
#import "TBZodiacCardModel.h"
#import <AudioToolbox/AudioToolbox.h>

@interface TBZodiacCardCollectionViewCell   ()

@property (nonatomic,weak) UIImageView *cardImageView;
@end
@implementation TBZodiacCardCollectionViewCell

+ (TBZodiacCardCollectionViewCell *)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    
    TBZodiacCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotationAll) name:@"RotationAllNotification" object:nil];
        [self setupUI];
    }
    return self;
}

- (void)rotationAll {
    
    [UIView transitionWithView:self.cardImageView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.cardImageView.image = [UIImage imageNamed:self.zodiacCardModel.picturePath];
    } completion:^(BOOL finished) {
       
    }];
}


- (void)setupUI {
    
//    self.contentView.backgroundColor = [UIColor redColor];
    UIImageView *cardImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_card_1"]];
//    cardImageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:cardImageView];
    self.cardImageView = cardImageView;
    [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(2, 2, 2, 2));
    }];
    
    
    
    
}

- (void)setZodiacCardModel:(TBZodiacCardModel *)zodiacCardModel {

    _zodiacCardModel = zodiacCardModel;
    self.cardImageView.image = [UIImage imageNamed:@"ico_card_1"];
//    self.cardImageView.image = [UIImage imageNamed:zodiacCardModel.picturePath];

}


- (void)startRotationAnimation:(void (^)(BOOL))completion {
    
    [UIView transitionWithView:self.cardImageView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [self playAudioFromFile:@"sound_38"];
        self.cardImageView.image = [UIImage imageNamed:self.zodiacCardModel.picturePath];
    } completion:^(BOOL finished) {
        completion(finished);
    }];
}



- (void)playAudioFromFile:(NSString *)fileName {
    
    NSString *audioFile=[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
    NSURL *fileUrl=[NSURL fileURLWithPath:audioFile];
    //1.获得系统声音ID
    SystemSoundID soundID=0;
    /**
     * inFileUrl:音频文件url
     * outSystemSoundID:声音id（此函数会将音效文件加入到系统音频服务中并返回一个长整形ID）
     */
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    //如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
    //    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    //2.播放音频
    AudioServicesPlaySystemSound(soundID);//播放音效
    //    AudioServicesPlayAlertSound(soundID);//播放音效并震动
    //3.销毁声音
    //    AudioServicesDisposeSystemSoundID(soundID);
}
@end
