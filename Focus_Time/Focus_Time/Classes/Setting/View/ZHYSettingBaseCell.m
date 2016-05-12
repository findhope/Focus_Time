//
//  ZHYSettingBaseCell.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingBaseCell.h"
#import "ZHYArrowItem.h"
#import "ZHYSwitchItem.h"
#import "ZHYSelectItem.h"

@interface ZHYSettingBaseCell ()

@property (weak, nonatomic) UIImageView *arrowView;
@property (weak, nonatomic) UISwitch *switchView;

@end

@implementation ZHYSettingBaseCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        
        img.width = 20;
        img.height = 20;
        
        [self.contentView addSubview:img];
        _arrowView = img;
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        UISwitch *swith = [[UISwitch alloc] init];
        swith.onTintColor = kARGBColor(0.4, 235, 235, 235);
        [self.contentView addSubview:swith];
        _switchView = swith;
    }
    return _switchView;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    
    
    ZHYSettingBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseCell];
    
    if (cell == nil) {
        
        cell = [[ZHYSettingBaseCell alloc] initWithStyle:style reuseIdentifier:BaseCell];
        
        cell.textLabel.textColor = kARGBColor(0.8, 255, 255, 255);
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        cell.detailTextLabel.textColor = kARGBColor(0.6, 255, 255, 255);
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        
    }
    
    [cell setupBackground];
    
    return cell;
}

- (void)setItem:(ZHYSettingItem *)item{

    _item = item;
    
    [self setupData];
    
    [self setupAccessoryView];

}

- (void)setupData
{
    if ([_item isKindOfClass:[ZHYSettingItem class]]) {
        
        self.textLabel.text = _item.title;
        self.imageView.image = _item.image;
        self.detailTextLabel.text = _item.subTitle;
        
    }else{
        
        self.textLabel.text = _item.title;
    }
}

- (void)setupBackground{
    
    self.backgroundColor = [UIColor clearColor];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, self.height, [UIScreen mainScreen].bounds.size.width - 30, 0.5)];
    lineView.backgroundColor = kARGBColor(0.6, 255, 255, 255);
    [self.contentView addSubview:lineView];
    
}

- (void)setupAccessoryView

{
    if ([_item isKindOfClass:[ZHYArrowItem class]]) {
        
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([_item isKindOfClass:[ZHYSwitchItem class]]){
        
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([_item isKindOfClass:[ZHYSelectItem class]]){

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }else{
        
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
}


@end
