//
//  ZHYCircleView.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCircleView.h"
#import "ZHYCircleAnimation.h"

@interface ZHYCircleView ()

@property (assign, nonatomic) CGRect rect;

@end

@implementation ZHYCircleView

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    self.rect = rect;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path   = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x + 3, rect.origin.y + 3, rect.size.width - 6, rect.size.height - 6)];
    CGContextAddPath(context, path.CGPath);
    CGContextSetLineWidth(context, 3);
    [kARGBColor(0.25, 255, 255, 255) setStroke];
    CGContextStrokePath(context);
    
}


@end
