//
//  ViewController.m
//  LLCarIndexDemo
//
//  Created by Leo on 11/28/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "ViewController.h"
#import "LLCar.h"
#import "LLCarGroup.h"
#import <MJExtension.h>

static NSString *cellID = @"car";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *carGroupArray;
@end

@implementation ViewController

/**
 *  懒加载
 */
- (NSMutableArray *)carGroupArray {
    
    if (!_carGroupArray) {
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars.plist" ofType:nil]];
//        NSMutableArray *temp = [NSMutableArray array];
//        for (NSDictionary *carGroupDict in dictArray) {
//            [temp addObject:[LLCarGroup carGroupWithDic:carGroupDict]];
//        }
        
        [LLCarGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"cars" : [LLCar class]};
        }];
        _carGroupArray = [LLCarGroup mj_objectArrayWithFilename:@"cars.plist"];
    }
    return _carGroupArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
    
}

/**
 *  配置表视图
 */
- (void)setupTableView {
    
    CGRect rect = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.carGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    LLCarGroup *group = self.carGroupArray[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //设置数据
    LLCarGroup *group = self.carGroupArray[indexPath.section];
    LLCar *car = group.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

#pragma mark -- UITableViewDataDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    LLCarGroup *group = self.carGroupArray[section];
    return group.title;
}

/**
 *  返回索引条文字
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
//    NSMutableArray *titles = [NSMutableArray array];
//    for (LLCarGroup *group in self.carGroupArray) {
//        [titles addObject:group.title];
//    }
//    return titles;
    
    return [self.carGroupArray valueForKeyPath:@"title"];
}

@end
