//
//  ZHYSettingItem.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ZHYSettingItem : NSObject

/** 描述cell图片 */
@property (strong, nonatomic) UIImage *image;
/** 描述cell左文字 */
@property (strong, nonatomic) NSString *title;
/** cell detail文字 */
@property (strong, nonatomic) NSString *subTitle;
/** 功能block */
@property (strong, nonatomic) void(^optionBlock)(NSIndexPath *indexPath);

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;



@end
