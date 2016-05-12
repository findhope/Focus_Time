//
//  ZHYMainCollectionController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/18.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMainCollectionController.h"
#import "ZHYMenuButton.h"
#import "ZHYSettingController.h"
#import "ZHYNavController.h"
#import "ZHYCircleView.h"
#import "ZHYCollectionViewCell.h"
#import "ZHYCircleAnimation.h"
#import "ZHYCollectionCellModelItem.h"
#import "ZHYTimeCountDownView.h"

@interface ZHYMainCollectionController ()


@property (weak, nonatomic) UIButton * menuButton;
@property (weak, nonatomic) UIButton * startButton;
@property (weak, nonatomic) UIButton * pauseButton;
@property (weak, nonatomic) UIButton * resumeButton;
@property (weak, nonatomic) UIButton * exitButton;
/** CellItem数组 */
@property (strong, nonatomic) NSMutableArray * itemGroup;

@property (weak, nonatomic) ZHYCircleAnimation * circleAnimation;
/** 开始屏幕圆圈内view */
@property (weak, nonatomic) UIView * titleView;
/** 倒计时view */
@property (weak, nonatomic) ZHYTimeCountDownView * CountDownView;
/** 倒计时定时器 */
@property (strong, nonatomic) NSTimer * myTimer;
/** 倒计时时间 */
@property (assign, nonatomic) NSInteger seconds;

@end

@implementation ZHYMainCollectionController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupCollectionView];
    [self setupButton];
    [self setupItems];
    
    //推送测试
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/**
 *  返回cell为流水布局的collectionView
 */
- (instancetype)init{
    
    UICollectionViewFlowLayout * collectionLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionLayout.itemSize = [UIScreen mainScreen].bounds.size;
    collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    collectionLayout.minimumLineSpacing = 0;
    return [super initWithCollectionViewLayout:collectionLayout];
    
}

/**
 *  添加圆圈内数据
 */
- (void)setupItems{
    
    _itemGroup = [NSMutableArray array];
    
    ZHYCollectionCellModelItem * page1 = [ZHYCollectionCellModelItem itemWithImage:[UIImage imageNamed:@"pageView1"] title:@"Afternoon" backgroundColor:kARGBColor(0.4, 6, 139, 229)];
    ZHYCollectionCellModelItem * page2 = [ZHYCollectionCellModelItem itemWithImage:[UIImage imageNamed:@"pageView2"] title:@"Rain" backgroundColor:kARGBColor(0.6, 70, 84, 92)];
    ZHYCollectionCellModelItem * page3 = [ZHYCollectionCellModelItem itemWithImage:[UIImage imageNamed:@"pageView3"] title:@"Forest" backgroundColor:kARGBColor(0.4, 49, 201, 48)];
    ZHYCollectionCellModelItem * page4 = [ZHYCollectionCellModelItem itemWithImage:[UIImage imageNamed:@"pageView4"] title:@"Beach" backgroundColor:kARGBColor(0.4, 6, 139, 229)];
    ZHYCollectionCellModelItem * page5 = [ZHYCollectionCellModelItem itemWithImage:[UIImage imageNamed:@"pageView5"] title:@"Muse" backgroundColor:kARGBColor(0.3, 134, 55, 225)];
    NSArray *array = @[page1,page2,page3,page4,page5];
    [_itemGroup addObjectsFromArray:array];
    
}
/**
 *  collecttionColltroner初始化设置
 */
- (void)setupCollectionView{
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"background_img"];
    imageView.alpha = 1;
    self.collectionView.backgroundView = imageView;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[ZHYCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    
}


/**
 *  点击继续按钮
 */
- (void)resumeButtonClick{

    NSLog(@"点击了继续按钮");
    
    [UIView animateWithDuration:0.2 animations:^{
        self.resumeButton.centerX += 58;
        self.resumeButton.alpha = 0.0;
        self.exitButton.centerX -= 58;
        self.exitButton.alpha = 0.0;
        self.pauseButton.alpha = 1;
    } completion:^(BOOL finished) {
       [self addCircleAnimation];
    }];
}
/**
 *  点击退出按钮
 */
- (void)exitButtonClick{

    NSLog(@"点击了退出按钮");
    self.collectionView.scrollEnabled = YES;
    
    [self.myTimer invalidate];
    _myTimer = nil;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.resumeButton.centerX += 58;
        self.resumeButton.alpha = 0.0;
        self.exitButton.centerX -= 58;
        self.exitButton.alpha = 0.0;
        self.startButton.alpha = 1;
    } completion:^(BOOL finished) {
        
        [UIView transitionWithView:self.titleView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            self.titleView.alpha = 1;
            
        } completion:nil];
        
        [UIView transitionWithView:self.CountDownView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{

            self.CountDownView.alpha = 0;
        } completion:nil];
    
        [self.circleAnimation removeFromSuperview];
        self.CountDownView.minuteLabel.text = @"00";
        self.CountDownView.middleLabel.text = @":";
        self.CountDownView.secondLabel.text = @"00";
        
    }];
}
/**
 *  点击暂停按钮
 */
- (void)pauseButtonClick{

    NSLog(@"点击了暂停按钮");
    
    [UIView animateWithDuration:0.1 animations:^{
        self.pauseButton.alpha = 0.0;
        self.exitButton.alpha = 1;
        self.resumeButton.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            self.resumeButton.centerX -= 58;
            self.exitButton.centerX += 58;
        }];
        [self.circleAnimation removeFromSuperview];
    }];
}

/**
 *  点击开始按钮
 */
- (void)startButtonClick{
    
    NSLog(@"点击了开始按钮");
    
    //点击了开始按钮之后淡入淡出隐藏自己并且屏幕不能滑动
    self.collectionView.scrollEnabled = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.startButton cache:YES];
        self.startButton.alpha = 0.0;
        self.pauseButton.alpha = 1;
    } completion:^(BOOL finished) {
        
        [self addCircleAnimation];
        
        [UIView transitionWithView:self.titleView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            self.titleView.alpha = 0;
        } completion:nil];
        
        [UIView transitionWithView:self.CountDownView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            self.CountDownView.alpha = 1;
        } completion:^(BOOL finished) {
            
            [self addTimer];//倒计时添加

        }];
        
        }];
}

/**
 *  开始圆圈扩散动画
 */
- (void)addCircleAnimation{

    ZHYCircleAnimation * circleAni = [[ZHYCircleAnimation alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenBounds.size.width * 0.62, ZHYScreenBounds.size.width * 0.62)];
    circleAni.centerX = self.view.centerX;
    circleAni.centerY = self.view.centerY * 0.7;
    self.circleAnimation = circleAni;
    [self.view addSubview:circleAni];
}


/**
 *  左上角菜单按钮
 */
- (void)menuButtonClick{
    
    ZHYSettingController * settingVC = [[ZHYSettingController alloc] init];
    ZHYNavController *navVC = [[ZHYNavController alloc] initWithRootViewController:settingVC];
    self.menuButton.hidden = YES;
    
    
    settingVC.block = ^(){
        ZHYWeakSelf;
        weakSelf.menuButton.hidden = NO;
    };
    navVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    navVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navVC animated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;// 状态栏颜色为白色
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return self.itemGroup.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.item = self.itemGroup[indexPath.item];
    self.titleView = cell.titleView;
    cell.timeView.alpha = 0;
    self.CountDownView = cell.timeView;
    
    
    if (indexPath.item == 0) {
        cell.titleView.mytitleLabel.font = [UIFont fontWithName:@"SFUIDisplay-Thin" size:30];
    }else{
        cell.titleView.mytitleLabel.font = [UIFont fontWithName:@"SFUIDisplay-Thin" size:48];
    }
    return cell;
}

#pragma mark <setupButton>
- (void)setupButton{
    
    //左上角Menu按钮
    ZHYMenuButton * menuButton = [[ZHYMenuButton alloc] init];
    menuButton.frame = CGRectMake(0, 20, 60, 60);
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(menuButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
    self.menuButton = menuButton;
    
    
    //继续按钮
    UIButton * resumeButton = [self setupButtonWithFrame:CGRectMake(0, 0, 100, 42) BGColor:kARGBColor(1, 83, 186, 156) Alpha:0 CenterX:self.view.centerX CenterY:self.view.centerY * 1.4 Title:@"Resume" FontSize:16 Action:@selector(resumeButtonClick)];
    [self.view addSubview:resumeButton];
    self.resumeButton = resumeButton;
    
    //退出按钮
    UIButton * exitButton = [self setupButtonWithFrame:CGRectMake(0, 0, 100, 42) BGColor:[UIColor clearColor] Alpha:0 CenterX:self.view.centerX CenterY:self.view.centerY * 1.4 Title:@"Exit" FontSize:16 Action:@selector(exitButtonClick)];
    exitButton.layer.borderWidth = 1;
    exitButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:exitButton];
    self.exitButton = exitButton;
    
    //暂停按钮
    UIButton * pauseButton = [self setupButtonWithFrame:CGRectMake(0, 0, 100, 42) BGColor:[UIColor clearColor] Alpha:0 CenterX:self.view.centerX CenterY:self.view.centerY * 1.4 Title:@"Pause" FontSize:16 Action:@selector(pauseButtonClick)];
    pauseButton.layer.borderWidth = 1;
    pauseButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:pauseButton];
    self.pauseButton = pauseButton;
    
    //开始按钮
    UIButton * startButton = [self setupButtonWithFrame:CGRectMake(0, 0, 120, 44) BGColor:kARGBColor(1, 255, 84, 84) Alpha:1 CenterX:self.view.centerX CenterY:self.view.centerY * 1.4 Title:@"Start" FontSize:18 Action:@selector(startButtonClick)];
    [self.view addSubview:startButton];
    self.startButton = startButton;
}
/**
 *  自定义button添加方法
 */

- (UIButton *)setupButtonWithFrame:(CGRect)frame BGColor:(UIColor *)color Alpha:(CGFloat)alpha CenterX:(CGFloat)centerX CenterY:(CGFloat)centerY Title:(NSString *)title FontSize:(CGFloat)size Action:(SEL)action{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = color;
    button.alpha = alpha;
    button.centerX = centerX;
    button.centerY = centerY;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    button.layer.cornerRadius = button.height *0.5;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)addTimer{
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshCountdownLabel) userInfo:nil repeats:YES];
    self.seconds = 1500; //_______________倒计时时间_______________
    [self.myTimer fire];

}

- (void)refreshCountdownLabel{

        if(self.seconds < 0){ //倒计时结束，关闭
            
            [self.myTimer invalidate];
            
            self.CountDownView.minuteLabel.text = @"00";
            self.CountDownView.middleLabel.text = @":";
            self.CountDownView.secondLabel.text = @"00";
            
            _myTimer = nil;
                //弹出休息页面  present一个新的控制器比较好
            
        }else{
            
            NSInteger minutes = self.seconds / 60;
            NSInteger seconds = self.seconds % 60;

                //设置界面的按钮显示 根据自己需求设置
                self.CountDownView.minuteLabel.text = [NSString stringWithFormat:@"%.2ld",(long)minutes];
                self.CountDownView.middleLabel.text = @":";
                self.CountDownView.secondLabel.text = [NSString stringWithFormat:@"%.2ld",(long)seconds];
            
            self.seconds--;
        }
    
}

@end
