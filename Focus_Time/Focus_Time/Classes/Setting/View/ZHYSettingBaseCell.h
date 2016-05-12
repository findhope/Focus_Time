//
//  ZHYSettingBaseCell.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHYSettingItem.h"

@interface ZHYSettingBaseCell : UITableViewCell

@property (strong, nonatomic) ZHYSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
