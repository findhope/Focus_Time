//
//  ZHYCollectionViewCell.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCollectionViewCell.h"
#import "ZHYCircleAnimation.h"
#import "ZHYTimeLabel.h"


@interface ZHYCollectionViewCell ()

@property (weak, nonatomic) ZHYCircleView * circleView;

@end



@implementation ZHYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        ZHYCircleView * circleView = [[ZHYCircleView alloc] initWithFrame:ZHYScreenBounds];
        self.circleView = circleView;
        circleView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:circleView];
        
        
        ZHYCalendarView * titleView = [[ZHYCalendarView alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenW, ZHYScreenH)];
        self.titleView = titleView;
        [self.contentView addSubview:titleView];
        
        ZHYTimeCountDownView * timeView = [[ZHYTimeCountDownView alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenW * 0.62, ZHYScreenW * 0.62)];
        
        [self.contentView addSubview:timeView];

        self.timeView = timeView;
    }
    return self;
}


- (void)layoutSubviews{

    [super layoutSubviews];

    self.circleView.width = ZHYScreenW * 0.62;
    self.circleView.height = ZHYScreenW * 0.62;
    self.circleView.centerX = self.contentView.centerX;
    self.circleView.centerY = self.contentView.centerY * 0.7;
    self.titleView.center = self.contentView.center;
    self.timeView.frame = self.circleView.frame;

}

- (void)setItem:(ZHYCollectionCellModelItem *)item{

    _item = item;
    _titleView.mytitleLabel.text = item.title;
    _titleView.pageView.image = item.pageCountImage;
    self.backgroundColor = item.bgColor;

}

@end
