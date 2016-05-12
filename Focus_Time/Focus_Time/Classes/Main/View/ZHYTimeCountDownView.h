//
//  ZHYTimeCountDownView.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHYTimeCountDownView : UIView

/** 分钟 */
@property (weak, nonatomic) UILabel * minuteLabel;

/** 秒 */
@property (weak, nonatomic) UILabel * secondLabel;
/** : */
@property (weak, nonatomic) UILabel * middleLabel;

@end
