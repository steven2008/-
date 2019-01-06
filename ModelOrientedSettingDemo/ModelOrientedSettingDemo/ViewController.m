//
//  ViewController.m
//  AdapterTableViewDemo
//
//  Created by steven on 2019/1/6.
//  Copyright © 2019年 steven. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RightViewSettingCellModel.h"
#import "RightTextSettingCellModel.h"
#import "AccessorySettingCellModel.h"
#import "SwithSettingCellModel.h"
#import "SettingTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *settingTabView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.settingTabView];
    [_settingTabView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SettingTableViewCell class])];
    
    [self.settingTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
    _dataSource = [NSMutableArray array];
    
    NSMutableArray *sectionOneMutableArr = [NSMutableArray array];
    RightViewSettingCellModel *rightViewSettingCellModel = [[RightViewSettingCellModel alloc] init];
    rightViewSettingCellModel.iconName = @"Image-1.png";
    rightViewSettingCellModel.titleStr = @"2G/3G图片显示";
    [sectionOneMutableArr addObject:rightViewSettingCellModel];
    
    SwithSettingCellModel *switchSettingCellModel = [[SwithSettingCellModel alloc] init];
    switchSettingCellModel.iconName = @"Image-2.png";
    switchSettingCellModel.titleStr =  @"地理位置公开";
    [sectionOneMutableArr addObject:switchSettingCellModel];
    [_dataSource addObject:sectionOneMutableArr];
    
    NSMutableArray *sectionTwoMutableArr = [NSMutableArray array];
    NSArray *swithTitleArr = @[@"GIF图自动播放",@"视频自动播放",@"wifi下自动播放更多视频",@"允许非wifi下自动播放视频"];
    for (int i=0; i<3; i++)
    {
        SwithSettingCellModel *switchSettingCellModel = [[SwithSettingCellModel alloc] init];
        switchSettingCellModel.iconName = @"Image-2.png";
        switchSettingCellModel.titleStr =  swithTitleArr[i];
        [sectionTwoMutableArr addObject:switchSettingCellModel];
    }
    [_dataSource addObject:sectionTwoMutableArr];

    NSMutableArray *sectionThreeMutableArr = [NSMutableArray array];
    NSArray *swithTitleArr2 = @[@"悄悄话推送",@"精彩内容推送"];
    for (int i=0; i<2; i++)
    {
        SwithSettingCellModel *switchSettingCellModel = [[SwithSettingCellModel alloc] init];
        switchSettingCellModel.iconName = @"Image-2.png";
        switchSettingCellModel.titleStr =  swithTitleArr2[i];
        [sectionThreeMutableArr addObject:switchSettingCellModel];
    }
    [_dataSource addObject:sectionThreeMutableArr];

    NSMutableArray *sectionFourMutableArr = [NSMutableArray array];
    NSArray *accessoryTitleArr = @[@"帮助",@"清除缓存",@"用户使用协议",@"当前版本"];
    for (int i=0; i<3; i++)
    {
        AccessorySettingCellModel *accessorySettingCellModel = [[AccessorySettingCellModel alloc] init];
        accessorySettingCellModel.iconName = @"Image-3.png";
        accessorySettingCellModel.titleStr =  accessoryTitleArr[i];
        [sectionFourMutableArr addObject:accessorySettingCellModel];
    }
    [_dataSource addObject:sectionFourMutableArr];
}

- (UITableView *)settingTabView
{
    if (nil == _settingTabView) {
        _settingTabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _settingTabView.dataSource = self;
        _settingTabView.delegate = self;
        
    }
    
    return _settingTabView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSMutableArray *)_dataSource[section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SettingTableViewCell class])];
    
    if (nil == cell)
    {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SettingTableViewCell class])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    SettingCellModel *dataModel = _dataSource[indexPath.section][indexPath.row];
    [cell setCellData:dataModel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
