//
//  ZHYLengthController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYLengthController.h"

@interface ZHYLengthController ()

@end

@implementation ZHYLengthController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Length";
    [self setupGroup1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGroup1{
    
    ZHYSelectItem *item1 = [ZHYSelectItem itemWithImage:nil title:@"5 Minutes"];
    ZHYSelectItem *item2 = [ZHYSelectItem itemWithImage:nil title:@"10 Minutes"];
    ZHYSelectItem *item3 = [ZHYSelectItem itemWithImage:nil title:@"15 Minutes"];
    ZHYSelectItem *item4 = [ZHYSelectItem itemWithImage:nil title:@"20 Minutes"];
    ZHYSelectItem *item5 = [ZHYSelectItem itemWithImage:nil title:@"25 Minutes"];
    ZHYSelectItem *item6 = [ZHYSelectItem itemWithImage:nil title:@"30 Minutes"];
    
    ZHYGroupItem *group = [[ZHYGroupItem alloc] init];
    group.headerString = @"Select Duration";
    group.items = @[item1,item2,item3,item4,item5,item6];
    
    [self.groups addObject:group];
    
}


@end
