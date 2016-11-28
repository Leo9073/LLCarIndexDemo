//
//  LLCarGroup.h
//  LLCarIndexDemo
//
//  Created by Leo on 11/28/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLCarGroup : NSObject
@property (copy,nonatomic) NSString *title;
@property (strong,nonatomic) NSArray *cars;

+ (instancetype)carGroupWithDic:(NSDictionary *)dict;
@end
