//
//  TgFooterView.h
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TgFooterView;

@protocol TgFooterViewDelegate <NSObject>


- (void)tgFooterViewDidClickDownloadButton:(TgFooterView *)footerView;

@end

@interface TgFooterView : UIView

@property (weak, nonatomic)id<TgFooterViewDelegate> delegate;

+ (instancetype)footerView;
- (void)endRefresh;

@end
