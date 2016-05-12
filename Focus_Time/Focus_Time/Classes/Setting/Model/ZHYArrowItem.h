//
//  ZHYArrowItem.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingItem.h"

@interface ZHYArrowItem : ZHYSettingItem

///** 描述cell左文字 */
//@property (strong, nonatomic) NSString *titleLeft;
///** 描述cell文字 */
//@property (strong, nonatomic) NSString *titleRight;

@property (nonatomic, assign) Class destClass;

//+ (instancetype)itemWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

@end
