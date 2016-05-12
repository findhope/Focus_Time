//
//  ZHYSettingsTableController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingsTableController.h"
#import "ZHYFocusDurationController.h"
#import "ZHYBreakDurationController.h"
#import "ZHYLongBreakController.h"

@interface ZHYSettingsTableController ()

@end

@implementation ZHYSettingsTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Settings";
    
    [self setupGroup1];
    
    [self setupGroup2];
    
    [self setupGroup3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 添加第一组
- (void)setupGroup1{
    
    ZHYArrowItem *item1 = [ZHYArrowItem itemWithImage:nil title:@"Focus Duration"];
    item1.subTitle = @"25 Minutes";
    item1.destClass = [ZHYFocusDurationController class];
    
    ZHYArrowItem *item2 = [ZHYArrowItem itemWithImage:nil title:@"Break Duration"];
    item2.subTitle = @"5 Minutes";
    item2.destClass = [ZHYBreakDurationController class];
    
    ZHYArrowItem *item3 = [ZHYArrowItem itemWithImage:nil title:@"Long Break"];
    item3.destClass = [ZHYLongBreakController class];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    group.headerString = @"Pomodoro Settings";
    group.items = @[item1,item2,item3];
    
    [self.groups addObject:group];
    
}

#pragma mark - 添加第二组
- (void)setupGroup2{
    
    ZHYSwitchItem *item1 = [ZHYSwitchItem itemWithImage:nil title:@"White Noise"];
    
    ZHYSwitchItem *item2 = [ZHYSwitchItem itemWithImage:nil title:@"Music Fusion"];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    
    group.headerString = @"Sounds Settings";
    
    group.items = @[item1,item2];
    
    [self.groups addObject:group];
    
}

#pragma mark - 添加第三组
- (void)setupGroup3{
    
    ZHYSwitchItem *item1 = [ZHYSwitchItem itemWithImage:nil title:@"Disable Lock Screen"];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    
    group.headerString = @"Advanced Settings";
    
    group.items = @[item1];
    
    [self.groups addObject:group];
    
}

@end
