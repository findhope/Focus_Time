//
//  UINavigationController+ZHYExtension.h
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ZHYExtension)


- (void)pushViewController:(UIViewController*)controller animatedWithTransition:(UIViewAnimationTransition)transition;

- (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition;


@end
