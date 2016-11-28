//
//  LLCar.m
//  LLCarIndexDemo
//
//  Created by Leo on 11/28/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "LLCar.h"

@implementation LLCar
+ (instancetype)carWithDic:(NSDictionary *)dict {
    
    LLCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}
@end
