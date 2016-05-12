//
//  ZHYLongBreakController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYLongBreakController.h"
#import "ZHYFrequencyController.h"
#import "ZHYLengthController.h"

@interface ZHYLongBreakController ()

@end

@implementation ZHYLongBreakController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Long Break";
    
    [self setupGroup1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGroup1{
    
    ZHYSwitchItem *item1 = [ZHYSwitchItem itemWithImage:nil title:@"Enable Long Break"];
    
    ZHYArrowItem *item2 = [ZHYArrowItem itemWithImage:nil title:@"Frequency"];
    item2.subTitle = @"4 Focuses";// 此处需要修改为变量
    item2.destClass = [ZHYFrequencyController class];
    
    ZHYArrowItem *item3 = [ZHYArrowItem itemWithImage:nil title:@"Length"];
    item3.subTitle = @"15 Minutes"; // 此处需要修改为变量
    item3.destClass = [ZHYLengthController class];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    group.headerString = @"Select Duration";
    group.items = @[item1,item2,item3];
    
    [self.groups addObject:group];
    
}

@end
