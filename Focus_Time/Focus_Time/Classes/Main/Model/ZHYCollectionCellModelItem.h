//
//  ZHYCollectionCellModelItem.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHYCollectionCellModelItem : NSObject

/** 页码指示器 */
@property (strong, nonatomic) UIImage *pageCountImage;

/** 上面文字 */
@property (strong, nonatomic) NSString * title;

/** cell背景Color */
@property (strong, nonatomic) UIColor * bgColor;


+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title backgroundColor:(UIColor *)color;

@end
