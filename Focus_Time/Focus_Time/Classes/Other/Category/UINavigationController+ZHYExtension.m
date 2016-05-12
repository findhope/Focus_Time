//
//  UINavigationController+ZHYExtension.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "UINavigationController+ZHYExtension.h"

@implementation UINavigationController (ZHYExtension)


- (void)pushAnimationDidStop {
    
}

- (void)pushViewController:(UIViewController*)controller animatedWithTransition:(UIViewAnimationTransition)transition{
    
    [self pushViewController:controller animated:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:TT_FLIP_TRANSITION_DURATION];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];    
    
}

- (void)aaapushViewController:(UIViewController*)controller animatedWithTransition:(UIViewAnimationTransition)transition{
    
    [self pushViewController:controller animated:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:TT_FLIP_TRANSITION_DURATION];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];


}

- (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition{
    
    UIViewController* poppedController = [self popViewControllerAnimated:NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:TT_FLIP_TRANSITION_DURATION];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(pushAnimationDidStop)];
    [UIView setAnimationTransition:transition forView:self.view cache:NO];
    [UIView commitAnimations];
    
    return poppedController;
}




@end
