//
//  ZHYBaseSettingController.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHYBaseTableView.h"
#import "ZHYSettingBaseCell.h"
#import "ZHYSettingItem.h"
#import "ZHYGroupItem.h"
#import "ZHYArrowItem.h"
#import "ZHYSwitchItem.h"
#import "ZHYSelectItem.h"

@interface ZHYBaseSettingController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/** tableView */
@property (weak, nonatomic) ZHYBaseTableView * tableView;

@property (strong, nonatomic) NSMutableArray *groups;

@end
