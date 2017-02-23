//
//  EMMDetailTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDetailTableViewController.h"
#import "EMMHistoryVersionTableViewController.h"
#import "EMMDetailInformationTableViewCell.h"

#import "EMMApplicationModel.h"

#define headerViewHeight 170

@interface EMMDetailTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation EMMDetailTableViewController
static NSString * const eMMDetailInformationTableViewCell = @"EMMDetailInformationTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UITableView
    [self setUpMyTableView];
    
    //
//    EMMApplicationModel *appModel = self.applicationModel;
//    YHLog(@"---%@", appModel);
}
#pragma mark - ********** 私有方法 **********
- (void)setUpMyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    // 设置偏移量
    CGFloat top = headerViewHeight;
    
//    是从那个页面跳转过来
    if ([EMMUserInfo sharedEMMUserInfo].isThree) {
        top += 64;
    }
    
    [self.myTableView setContentInset:UIEdgeInsetsMake(top, 0, 0, 0)];
    // 头部的View
    [self setUpMyTableViewHeaderView];
    // 尾部的View
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    UILabel *companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, ScreenW-60, 44)];
//    companyLabel.text = @"腾讯科技有限公司";
    companyLabel.text = self.applicationModel.developer;
    companyLabel.textColor = [UIColor grayColor];
    companyLabel.font = [UIFont systemFontOfSize:13];
    [footerView addSubview:companyLabel];
    self.myTableView.tableFooterView = footerView;
    // 注册cell
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([EMMDetailInformationTableViewCell class]) bundle:nil] forCellReuseIdentifier:eMMDetailInformationTableViewCell];
}

- (void)setUpMyTableViewHeaderView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, ScreenW, 300)];
    scrollView.pagingEnabled = YES;
    
    NSArray *imagesArr = self.applicationModel.screenshots;
    
    CGRect frame = CGRectMake(20, 10, 180, 280);
    CGFloat space = 15;
    for (int i = 0; i < imagesArr.count; i++) {
        if (i != 0) {
            frame.origin.x = frame.origin.x + frame.size.width + space;
        }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
//        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_yixin0%d", imagesArr]];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", ImagesUrl, imagesArr[i]]]];
        [scrollView addSubview:imageView];
    }
    CGSize scrollViewFrame = CGSizeMake(frame.origin.x + frame.size.width, 280);
    scrollView.contentSize = scrollViewFrame;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    self.myTableView.tableHeaderView = scrollView;
}

#pragma mark - ********** UITableView数据源和代理方法 **********
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 3) {
        EMMDetailInformationTableViewCell *searchResultsCell = [tableView dequeueReusableCellWithIdentifier:eMMDetailInformationTableViewCell];
        [searchResultsCell setInfo:self.applicationModel];
        searchResultsCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return searchResultsCell;
        return nil;
    }else{
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    cell.detailTextLabel.text = @"微信，是一个生活方式。\n· 在聊天中，可以发送文字、语音、表情、图片、视频等。\n· 高质量语音和视频通话，随时和朋友面对面。\n· 朋友圈，记录你和朋友们的生活。";
        
        switch (indexPath.row) {
            case 3:{
                cell.textLabel.text = @"版本记录";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
                
            case 4:{
                cell.textLabel.text = @"开发人员其他App";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
                break;
        }
        
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 3) {
        return 106;
    }else{
        return 44;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 3:
            [self.navigationController pushViewController:[[EMMHistoryVersionTableViewController alloc] init] animated:YES];
            break;
            
        default:
            break;
    }
    
}

@end
