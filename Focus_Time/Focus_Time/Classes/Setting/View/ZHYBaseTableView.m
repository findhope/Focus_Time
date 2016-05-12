//
//  ZHYBaseTableView.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYBaseTableView.h"

@implementation ZHYBaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setFrame:(CGRect)frame{

    frame.origin.y += 64;
    
    [super setFrame:frame];

}


@end
