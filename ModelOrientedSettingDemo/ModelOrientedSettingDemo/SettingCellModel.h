//
//  SettingCellModel.h
//  AdapterTableViewDemo
//
//  Created by steven on 2019/1/6.
//  Copyright © 2019年 steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CellSelectedBlock)(void);

@interface SettingCellModel : NSObject

@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,strong) CellSelectedBlock cellBlock;
@property (nonatomic,assign) Class targetVC;

@end
