//
//  ZHYTimeCountDownView.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTimeCountDownView.h"



@implementation ZHYTimeCountDownView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat minuteWidth = frame.size.width * 0.5 - 12;
        CGFloat middleX = minuteWidth + 2;
        CGFloat secondX = middleX + 22;
        CGFloat height = frame.size.height;
        
        UILabel * minuteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, minuteWidth, height)];
        minuteLabel.textColor = kARGBColor(0.6, 255, 255, 255);
        minuteLabel.font = [UIFont fontWithName:@"SFUIDisplay-Thin" size:46];
        minuteLabel.textAlignment = NSTextAlignmentRight;
        self.minuteLabel = minuteLabel;
        
        UILabel * middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(middleX, 0, 20, height)];
        middleLabel.textColor = kARGBColor(0.6, 255, 255, 255);
        middleLabel.font = [UIFont fontWithName:@"SFUIDisplay-Thin" size:40];
        middleLabel.textAlignment = NSTextAlignmentCenter;
        self.middleLabel = middleLabel;
        
        UILabel * secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(secondX, 0, minuteWidth, height)];
        secondLabel.textColor = kARGBColor(0.6, 255, 255, 255);
        secondLabel.font = [UIFont fontWithName:@"SFUIDisplay-Thin" size:46];
        secondLabel.textAlignment = NSTextAlignmentLeft;
        self.secondLabel = secondLabel;
        
        [self addSubview:minuteLabel];
        [self addSubview:secondLabel];
        [self addSubview:middleLabel];
        
//        minuteLabel.text = [NSString stringWithFormat:@"%.2d",00];
//        middleLabel.text = @":";
//        secondLabel.text = [NSString stringWithFormat:@"%.2d",00];
        
    }
    return self;
}


@end
