//
//  LLCar.h
//  LLCarIndexDemo
//
//  Created by Leo on 11/28/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCar : NSObject
@property (copy,nonatomic) NSString *icon;
@property (copy,nonatomic) NSString *name;

+ (instancetype)carWithDic:(NSDictionary *)dict;
@end
