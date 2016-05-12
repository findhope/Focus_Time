//
//  ZHYBaseSettingController.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYBaseSettingController.h"

@interface ZHYBaseSettingController ()

/** 保存上一次的选中索引 */
@property (strong, nonatomic) NSIndexPath * lastIndexPath;

@end

@implementation ZHYBaseSettingController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupViewBackground];
    
    [self setupTableView];
    

}

- (void)setupViewBackground{
    
    self.navigationController.navigationBarHidden = NO;
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)setupTableView{

    ZHYBaseTableView * myTableView = [[ZHYBaseTableView alloc] initWithFrame:ZHYScreenBounds style:UITableViewStyleGrouped];
    self.tableView = myTableView;
    [self.view addSubview:myTableView];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 44;
    myTableView.dataSource = self;
    myTableView.delegate = self;

}

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        
        _groups = [NSMutableArray array];
    }
    return _groups;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ZHYGroupItem *group = self.groups[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ZHYSettingBaseCell *cell = [ZHYSettingBaseCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    ZHYGroupItem *group = self.groups[indexPath.section];
    
    ZHYSettingItem *item = group.items[indexPath.row];
    
    cell.item = item;
    
    

    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        
        if (indexPath.row == 3) {
            
            cell.selected = YES;
            
            self.lastIndexPath = indexPath;
        }
    }
    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        
        
        if (cell.selected == YES) {
            
            UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected"]];
            img.width = 20;
            img.height = 20;
            
            cell.accessoryView = img;
        }
        
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{


    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{


    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    ZHYGroupItem *group = self.groups[section];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenW, 44)];
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 22, ZHYScreenW, 22)];
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 44, ZHYScreenW - 30, 0.5)];
    lineView.backgroundColor = kARGBColor(0.6, 255, 255, 255);
    headerLabel.textColor = kARGBColor(0.8, 255, 255, 255);
    headerLabel.font = [UIFont systemFontOfSize:12];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = group.headerString;
    [self.tableView addSubview:headerView];
    [headerView addSubview:headerLabel];
    [headerView addSubview:lineView];
    
    return headerView;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self tableView:self.tableView didDeselectRowAtIndexPath:self.lastIndexPath];
    
    self.lastIndexPath = indexPath;
    
    ZHYGroupItem *group = self.groups[indexPath.section];
    
    ZHYArrowItem *item = group.items[indexPath.row];
    
    if (item.optionBlock) {
        item.optionBlock(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[ZHYArrowItem class]]) {
        
        if (item.destClass) {
            
            UIViewController *vc = [[item.destClass alloc] init];
            
            [self.navigationController pushViewController:vc animatedWithTransition:UIViewAnimationTransitionCurlUp];
        }
    }
    
    ZHYSettingBaseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        
        cell.selected = YES;
        
        if (cell.selected == YES) {
            
            UIImageView * img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected"]];
            img.width = 20;
            img.height = 20;
            
            cell.accessoryView = img;
        }
        
    }
    
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    ZHYGroupItem *group = self.groups[indexPath.section];
    
    ZHYSettingItem *item = group.items[indexPath.row];
    
    ZHYSettingBaseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.selected = NO;
    
    if ([item isKindOfClass:[ZHYSelectItem class]]) {
        
    cell.accessoryView = nil;

    }
}

@end
