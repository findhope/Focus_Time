//
//  ZHYMenuButton.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMenuButton.h"

@implementation ZHYMenuButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.x = 20;
    self.imageView.y = 20;
    self.imageView.width = 20;
    self.imageView.height = 20;
    
}

@end
