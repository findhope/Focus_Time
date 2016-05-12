//
//  ZHYCollectionCellModelItem.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCollectionCellModelItem.h"

@implementation ZHYCollectionCellModelItem


+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title backgroundColor:(UIColor *)color{
    
    ZHYCollectionCellModelItem *item = [[self alloc] init];
    item.pageCountImage = image;
    item.title = title;
    item.bgColor = color;
    return item;
}


@end
