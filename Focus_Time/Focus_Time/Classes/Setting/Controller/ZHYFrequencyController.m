//
//  ZHYFrequencyController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYFrequencyController.h"

@interface ZHYFrequencyController ()

@end

@implementation ZHYFrequencyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Frequency";
    
    [self setupGroup1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGroup1{
    
    ZHYSelectItem *item1 = [ZHYSelectItem itemWithImage:nil title:@"3 Focuses"];
    ZHYSelectItem *item2 = [ZHYSelectItem itemWithImage:nil title:@"4 Focuses"];
    ZHYSelectItem *item3 = [ZHYSelectItem itemWithImage:nil title:@"5 Focuses"];
    ZHYSelectItem *item4 = [ZHYSelectItem itemWithImage:nil title:@"6 Focuses"];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    group.headerString = @"Long Break Intervals";
    group.items = @[item1,item2,item3,item4];
    
    [self.groups addObject:group];
    
}

@end
