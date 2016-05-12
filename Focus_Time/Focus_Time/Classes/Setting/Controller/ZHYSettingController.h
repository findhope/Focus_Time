//
//  ZHYSettingController.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZHYSettingControllerBlock)();

@interface ZHYSettingController : UIViewController

/** 关闭控制器时回调block */
@property (strong, nonatomic) ZHYSettingControllerBlock block;

@end
