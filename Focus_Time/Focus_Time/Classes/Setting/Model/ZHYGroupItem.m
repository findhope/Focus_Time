//
//  ZHYGroupItem.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYGroupItem.h"

@interface ZHYGroupItem ()


@end

@implementation ZHYGroupItem

+ (instancetype)groupWithItems:(NSArray *)items{
    
    ZHYGroupItem *item = [[ZHYGroupItem alloc] init];
    
    item.items = items;
    
    return item;
}

@end
