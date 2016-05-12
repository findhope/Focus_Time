//
//  ZHYNavController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYNavController.h"

@interface ZHYNavController () <UIGestureRecognizerDelegate>

@end

@implementation ZHYNavController

+ (void)initialize{

    /** 设置UINavigationBar */
    UINavigationBar *bar = [UINavigationBar appearance];
    // 设置背景
    [bar setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
    // 设置标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    barAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:barAttrs];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupNavgation];
}

- (void)setupNavgation{

    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.barStyle = UIBaselineAdjustmentNone;
    
    UIImageView * backgroundview = [[UIImageView alloc] initWithFrame:ZHYScreenBounds];
    [self.view addSubview:backgroundview];
    [self.view sendSubviewToBack:backgroundview];
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = ZHYScreenBounds;
    [backgroundview addSubview:visualEffectView];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (不是第一个push进来的子控制器) {
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setBackgroundImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
        [backButton setFrame:CGRectMake(-10, 0, 22, 20)];
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}

- (void)backClick{
    
//    [self popViewControllerAnimated:YES];
    [self popViewControllerAnimatedWithTransition:UIViewAnimationTransitionCurlDown];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果当前显示的是第一个子控制器,就应该禁止掉[返回手势]
    //    if (self.childViewControllers.count == 1) return NO;
    //    return YES;
    return self.childViewControllers.count > 1;
}

/**
 *  状态栏白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}


@end
