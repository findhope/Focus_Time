//
//  ZHYCircleAnimation.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCircleAnimation.h"

@implementation ZHYCircleAnimation

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [super drawRect:rect];
    
    //添加动画
    NSInteger pulsingCount = 4;
    NSInteger animationDuration = 6;
    CALayer * animationLayer = [CALayer layer];
    
    for (NSInteger i = 0; i < pulsingCount; i++) {
        
        CALayer * pulsingLayer                 = [CALayer layer];
        pulsingLayer.frame                     = rect;
        pulsingLayer.borderColor               = kARGBColor(0.4, 255, 255, 255).CGColor;
        pulsingLayer.borderWidth               = 1.5;
        pulsingLayer.cornerRadius              = rect.size.height / 2;
        
        CAMediaTimingFunction * defaultCurve   = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
        CAAnimationGroup * animationGroup      = [CAAnimationGroup animation];
        animationGroup.fillMode                = kCAFillModeBackwards;
        animationGroup.beginTime               = CACurrentMediaTime() + i * animationDuration / pulsingCount;
        animationGroup.duration                = animationDuration;
        animationGroup.repeatCount             = HUGE;
        animationGroup.timingFunction          = defaultCurve;
        
        CABasicAnimation * scaleAnimation      = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue               = @1.0;
        scaleAnimation.toValue                 = @1.15;
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values                = @[@0, @0.4, @0.4, @0.4, @0.4, @0.3, @0.3, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes              = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        
        animationGroup.animations              = @[scaleAnimation, opacityAnimation];
        
        [pulsingLayer addAnimation:animationGroup forKey:@"plulsing"];
        [animationLayer addSublayer:pulsingLayer];
        [self.layer addSublayer:animationLayer];

        }
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
