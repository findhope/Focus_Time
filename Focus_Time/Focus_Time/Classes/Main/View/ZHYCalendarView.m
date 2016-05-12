//
//  ZHYCalendarView.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCalendarView.h"
#import "ZHYTimeLabel.h"

@interface ZHYCalendarView ()

/** timeLabel */
@property (weak, nonatomic) ZHYTimeLabel * timelabel;

@end

@implementation ZHYCalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel * myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenW * 0.45, 60)];
        UIImageView * pageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 69.6, 8)];
        ZHYTimeLabel * timeLabel = [[ZHYTimeLabel alloc] initWithFrame:CGRectMake(0, 0, 110, 25)];
        
        myLabel.textColor = kARGBColor(0.8, 255, 255, 255);
        myLabel.textAlignment = NSTextAlignmentCenter;
        
        self.mytitleLabel = myLabel;
        self.pageView = pageView;
        self.timelabel = timeLabel;
        
        [self addSubview:pageView];
        [self addSubview:myLabel];
        [self addSubview:timeLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.mytitleLabel.centerX = self.centerX;
    self.mytitleLabel.centerY = self.centerY * 0.65;
    
    self.timelabel.centerX = self.centerX;
    self.timelabel.centerY = self.centerY * 0.79;
    
    self.pageView.centerX = self.centerX ;
    self.pageView.centerY = self.centerY * 0.90;
    
    


}

@end
