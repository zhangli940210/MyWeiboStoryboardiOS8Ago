//
//  ViewController.m
//  15-自定义不等高的cell-Autolayout(IOS8之前)
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "XMGStatus.h"
#import "XMGStatusCell.h"

@interface ViewController ()

/** 微博模型数据*/
@property (nonatomic, strong) NSArray *statuses;
@end

@implementation ViewController

#pragma mark - 懒加载数据
NSString *ID = @"status";

- (NSArray *)statuses
{
    if (!_statuses) {
        _statuses = [XMGStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 估计高度，这样可以减少对heightForRowAtIndexPath方法的调用
    self.tableView.estimatedRowHeight = 200;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 去缓存池里面找，如果没有找到，去storyboard里面找
    XMGStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 传递模型数据
    cell.status = self.statuses[indexPath.row];
    return cell;
}

// 方案:在这个方法返回之前就要确定好cell的高度

// 笔者认真想了一天，怎么透彻的理解全局这个cell的作用，
// 最终笔者想到一个恰当的例子，就比如说，把cell比作一个水杯，容器，
// 里面的数据status就是水，算每一个cell的高度，就是算每一次倒入水的高度

XMGStatusCell *cell;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
        // 如果没有找到，那么就去storyboard里面找
    }
    
    cell.status = self.statuses[indexPath.row];
    
    return cell.cellHeight;
}


@end
