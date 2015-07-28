//
//  TgCell.h
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tg;
@interface TgCell : UITableViewCell

@property (strong, nonatomic)Tg *tg;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
