//
//  SettingTableViewCell.m
//  AdapterTableViewDemo
//
//  Created by steven on 2019/1/6.
//  Copyright © 2019年 steven. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "Masonry.h"
#import "RightViewSettingCellModel.h"
#import "RightTextSettingCellModel.h"
#import "AccessorySettingCellModel.h"
#import "SwithSettingCellModel.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.rightView];
        [self.contentView addSubview:self.rightSwitch];
        [self.contentView addSubview:self.rightLabel];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
            make.right.equalTo(self.titleLabel.mas_left).with.offset(-5);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_top);
            make.left.equalTo(self.iconImageView.mas_right).with.offset(5);
            make.bottom.equalTo(self.iconImageView.mas_bottom);
            make.right.equalTo(self.rightView.mas_left).with.offset(10);
        }];
        
        [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(5);
            //make.left.equalTo(self.titleLabel.mas_right).with.offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
            make.right.equalTo(self.contentView.mas_right).with.offset(-5);
        }];
        
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_top);
            make.bottom.equalTo(self.iconImageView.mas_bottom);
            make.right.equalTo(self.contentView.mas_right).with.offset(-5);
        }];
        
        [self.rightSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_top);
            make.bottom.equalTo(self.iconImageView.mas_bottom);
            make.right.equalTo(self.contentView.mas_right).with.offset(-5);
        }];
    }
    
    return self;
}

- (UIImageView *)iconImageView
{
    if (nil == _iconImageView)
    {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (nil == _titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    
    return _titleLabel;
}

- (UISegmentedControl *)rightView
{
    if (nil == _rightView)
    {
        _rightView = [[UISegmentedControl alloc] initWithItems:@[@"大图",@"无图",@"小图"]];
    }
    
    return _rightView;
}

- (UISwitch *)rightSwitch
{
    if (nil == _rightSwitch)
    {
        _rightSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    }
    
    return _rightSwitch;
}

- (UILabel *)rightLabel
{
    if (nil == _rightLabel)
    {
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rightLabel.font = [UIFont systemFontOfSize:16];
    }
    
    return _rightLabel;
}

- (void)setCellData:(SettingCellModel *)dataModel
{
    self.imageView.image = [UIImage imageNamed:dataModel.iconName];
    self.textLabel.text = dataModel.titleStr;
    
    if ([dataModel isMemberOfClass:[RightViewSettingCellModel class]])
    {
        self.accessoryType = UITableViewCellAccessoryNone;;
        self.rightView.hidden = NO;
        self.rightLabel.hidden = YES;
        self.rightSwitch.hidden = YES;
        
    }else if ([dataModel isMemberOfClass:[RightTextSettingCellModel class]])
    {
        self.accessoryType = UITableViewCellAccessoryNone;;
        self.rightView.hidden = YES;
        self.rightLabel.hidden = NO;
        self.rightLabel.text = @"2000000";
        self.rightSwitch.hidden = YES;
    }else if ([dataModel isMemberOfClass:[AccessorySettingCellModel class]])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.rightView.hidden = YES;
        self.rightLabel.hidden = NO;
        self.rightLabel.text = @"2000000";
        self.rightSwitch.hidden = YES;
        
    }else if ([dataModel isMemberOfClass:[SwithSettingCellModel class]])
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.rightView.hidden = YES;
        self.rightLabel.hidden = YES;
        self.rightSwitch.hidden = NO;
    }
    else
    {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.rightView.hidden = YES;
        self.rightLabel.hidden = YES;
        self.rightSwitch.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
