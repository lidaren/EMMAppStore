//
//  EMMCommentTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMCommentTableViewCell.h"
#import "EMMDetailView.h"

@interface EMMCommentTableViewCell ()
@property (nonatomic, weak) EMMDetailView *detailView;
@end

@implementation EMMCommentTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    EMMCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[EMMCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        // 1.添加微博具体内容
        EMMDetailView *detailView = [[EMMDetailView alloc] init];
        [self.contentView addSubview:detailView];
        self.detailView = detailView;
    }
    return self;
}

@end
