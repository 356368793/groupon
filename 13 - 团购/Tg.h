//
//  Tg.h
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tg : NSObject
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *price;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)tgs;

@end
