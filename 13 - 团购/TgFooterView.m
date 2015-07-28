//
//  TgFooterView.m
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "TgFooterView.h"

@interface TgFooterView()
@property (weak, nonatomic)IBOutlet UIButton *btn;
@property (weak, nonatomic)IBOutlet UIView *view;

@end


@implementation TgFooterView

+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TgFooterView" owner:nil options:nil] lastObject];
}

- (IBAction)btnClick {
    self.btn.hidden = YES;
    self.view.hidden = NO;

    // 用代理实现加载数据
    if ([self.delegate respondsToSelector:@selector(tgFooterViewDidClickDownloadButton:)]) {
        [self.delegate tgFooterViewDidClickDownloadButton:self];
    }
}

- (void)endRefresh
{
    NSLog(@"加载完成");
    self.btn.hidden = NO;
    self.view.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
