//
//  ZHYCollectionViewCell.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHYCircleView.h"
#import "ZHYCollectionCellModelItem.h"
#import "ZHYCalendarView.h"
#import "ZHYTimeCountDownView.h"

@interface ZHYCollectionViewCell : UICollectionViewCell

/** 圆圈中间的翻转View */
@property (weak, nonatomic) ZHYCalendarView * titleView;

/** 圆圈中间的翻转View */
@property (weak, nonatomic) ZHYTimeCountDownView * timeView;

@property (strong, nonatomic) ZHYCollectionCellModelItem *item;



@end
