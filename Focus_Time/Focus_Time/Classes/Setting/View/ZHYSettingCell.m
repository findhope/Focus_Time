//
//  ZHYSettingCell.m
//  Focus_Time
//
//  Created by MitnickKevin on 16/4/11.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingCell.h"
#import "ZHYSettingItem.h"

@interface ZHYSettingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *tagImageView;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;



@end

@implementation ZHYSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSettingModel:(ZHYSettingItem *)settingModel{
    
    _settingModel = settingModel;
    
    self.tagImageView.image = self.settingModel.image;
    self.tagLabel.text = self.settingModel.title;
    
}

@end
