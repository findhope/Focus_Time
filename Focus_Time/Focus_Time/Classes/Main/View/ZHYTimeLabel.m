//
//  ZHYTimeLabel.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTimeLabel.h"

@implementation ZHYTimeLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        NSCalendar * calendar = [NSCalendar currentCalendar];
        NSDateComponents *comp = [calendar components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitYear fromDate:[NSDate date]];
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        fmt.dateFormat = @"MMM. dd EEE yyyy";
        NSDate * now = [calendar dateFromComponents:comp];
        NSString * nowdate = [fmt stringFromDate:now];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:frame];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = kARGBColor(0.5, 255, 255, 255);
        label.font = [UIFont systemFontOfSize:13];
        label.text = nowdate;
        [self addSubview:label];
        
        UIView * labelTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, label.width, 1)];
        labelTopView.backgroundColor = kARGBColor(0.6, 255, 255, 255);
        [label addSubview:labelTopView];
        
        UIView * labelBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, label.height, label.width, 1)];
        labelBottomView.backgroundColor = kARGBColor(0.6, 255, 255, 255);
        [label addSubview:labelBottomView];

    }


    return self;
}

@end
