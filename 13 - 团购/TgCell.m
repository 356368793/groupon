//
//  TgCell.m
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "TgCell.h"
#import "Tg.h"

@interface TgCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;


@end

@implementation TgCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    TgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
//        NSLog(@"加载XIB");
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TgCell" owner:nil options:nil] lastObject];
    }
    tableView.rowHeight = 80.0;
    return cell;
}

- (void)setTg:(Tg *)tg
{
    _tg = tg;
    self.iconImage.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = tg.price;
    self.buyCountLabel.text = tg.buyCount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
