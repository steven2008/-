//
//  SettingTableViewCell.h
//  AdapterTableViewDemo
//
//  Created by steven on 2019/1/6.
//  Copyright © 2019年 steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingCellModel.h"

typedef void (^CellSelectedBlock)(void);

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UISegmentedControl *rightView;
@property (nonatomic,strong) UILabel *rightLabel;
@property (nonatomic,strong) UISwitch *rightSwitch;
@property (nonatomic,strong) CellSelectedBlock cellSelectedBlock;

- (void)setCellData:(SettingCellModel *)dataModel;

@end
