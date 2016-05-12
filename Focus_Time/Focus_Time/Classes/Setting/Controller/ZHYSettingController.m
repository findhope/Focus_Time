//
//  ZHYSettingController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingController.h"
#import "ZHYSettingCell.h"
#import "ZHYSettingItem.h"
#import "ZHYNavController.h"
#import "ZHYBaseSettingController.h"
#import "ZHYSettingsTableController.h"
//#import "ZHYImage.h"

@interface ZHYSettingController () <UITableViewDataSource,UITableViewDelegate>

/** 设置Items */
@property (strong, nonatomic) NSMutableArray *items;

@property (weak, nonatomic) IBOutlet UITableView *settingTableView;


@end

@implementation ZHYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupTableView];
    [self setupItems];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonClick {
    if (_block) {
        _block();
        //用回调代替代理方式来显示主页面按钮
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupItems{
    
    self.items = [NSMutableArray array];
    ZHYSettingItem * setting = [ZHYSettingItem itemWithImage:[UIImage imageNamed:@"setting"] title:@"Settings"];
    ZHYSettingItem * writeAReview = [ZHYSettingItem itemWithImage:[UIImage imageNamed:@"appraise"] title:@"Write a Review"];
    ZHYSettingItem * share = [ZHYSettingItem itemWithImage:[UIImage imageNamed:@"share"] title:@"Share"];
    ZHYSettingItem * about = [ZHYSettingItem itemWithImage:[UIImage imageNamed:@"about"] title:@"About"];
    NSArray *array = @[setting,writeAReview,share,about];
    [self.items addObjectsFromArray:array];
    
}

- (void)setupTableView{
    
    self.settingTableView.dataSource = self;
    self.settingTableView.delegate = self;
    self.settingTableView.rowHeight = 48;
    [self.settingTableView registerNib:[UINib nibWithNibName:@"ZHYSettingCell" bundle:nil] forCellReuseIdentifier:ID];
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;// 状态栏颜色为白色
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZHYSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.settingModel = self.items[indexPath.row];
    
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        ZHYSettingsTableController * settings = [[ZHYSettingsTableController alloc] init];
        [self.navigationController pushViewController:settings animatedWithTransition:UIViewAnimationTransitionCurlUp];
        
    }
}


@end
