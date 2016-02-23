//
//  XMGStatusCell.m
//  12-自定义不等高的cell-frame01-
//
//  Created by xiaomage on 16/1/30.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGStatusCell.h"
#import "XMGStatus.h"


@interface XMGStatusCell ()
/** 图像*/
@property (nonatomic ,weak) IBOutlet UIImageView *iconImageView;

/** 昵称*/
@property (nonatomic ,weak) IBOutlet UILabel *nameLabel;

/** vip*/
@property (nonatomic ,weak) IBOutlet UIImageView *vipImageView;

/** 正文*/
@property (nonatomic ,weak) IBOutlet UILabel *text_Label;

/** 配图*/
@property (nonatomic ,weak) IBOutlet UIImageView *pictureImageView;


@end

@implementation XMGStatusCell

// XMGStatusCell从storyboard里面加载会调用该方法
- (void)awakeFromNib
{
    // 手动设置label的文字的最大宽度(目的:为了能够计算label的高度,得到最真实的尺寸)
    self.text_Label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

// 设置数据
- (void)setStatus:(XMGStatus *)status
{
    _status = status;
    // 设置头像图片
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    // 设置昵称
    self.nameLabel.text = status.name;
    // 判断是否是vip
    if (status.isVip) { // 是VIP
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    // 设置正文
    self.text_Label.text = status.text;
    // 判断是否有配图
    if (status.picture) { // 有配图
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
    
}

- (CGFloat)cellHeight
{
    // 强制布局(目的:让label根据设置的约束计算自己最真实尺寸)
    [self layoutIfNeeded];
    
    CGFloat cellHeight = 0;
    
    if (self.status.picture) { // 有配图
        cellHeight = CGRectGetMaxY(self.pictureImageView.frame) + 10;
    } else {
        cellHeight = CGRectGetMaxY(self.text_Label.frame) + 10;
    }
    
    return cellHeight;
}

@end
