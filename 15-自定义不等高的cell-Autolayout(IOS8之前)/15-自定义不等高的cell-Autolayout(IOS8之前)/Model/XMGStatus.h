//
//  XMGStatus.h
//  12-自定义不等高的cell-frame01-
//
//  Created by xiaomage on 16/1/30.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGStatus : NSObject

/** 图像*/
@property (nonatomic ,strong) NSString *icon;

/** 昵称*/
@property (nonatomic ,strong) NSString *name;

/** 内容(正文)*/
@property (nonatomic ,strong) NSString *text;

/** vip*/
@property (nonatomic ,assign ,getter=isVip) BOOL vip;

/** 配图*/
@property (nonatomic ,strong) NSString *picture;

@end
