//
//  ZHYSettingItem.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingItem.h"

@implementation ZHYSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title{
    
    ZHYSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}



@end
