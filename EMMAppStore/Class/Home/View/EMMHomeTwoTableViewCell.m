//
//  EMMHomeTwoTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/24.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMHomeTwoTableViewCell.h"
#import "EMMHomeCollectionViewCell.h"

@interface EMMHomeTwoTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionV;

@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation EMMHomeTwoTableViewCell

static NSString * const eMMHomeColectionCell = @"eMMHomeCollectionViewCell";

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    
    _imagesArr = @[@"img_baidu", @"img_bfvideo", @"img_today", @"img_tmall", @"img_qqmall", @"img_souhu", @"img_zhihubao", @"img_aqiyi", @"img_gdmap", @"img_weibo"];
    _titleArr = @[@"手机百度", @"暴风影音", @"今日头条", @"天猫", @"QQ邮箱", @"搜狐", @"支付宝", @"爱奇艺", @"高德地图", @"微博"];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self addCollectionViewPicture];
}

/**
 * 注册Cell
 */
-(void)addCollectionViewPicture{
    //创建一种布局
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc]init];
    //设置每一个item的大小
    CGFloat itemWidth = (self.frame.size.width - 90) / 4;
    flowL.itemSize = CGSizeMake(itemWidth , itemWidth + 44);
    flowL.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    //列
    flowL.minimumInteritemSpacing = 10;
    //行
    flowL.minimumLineSpacing = 20;
    //创建集合视图
    self.collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, self.frame.size.height) collectionViewLayout:flowL];
    _collectionV.backgroundColor = [UIColor whiteColor];
    
    self.collectionV.scrollEnabled = NO;
    
    // NSLog(@"-----%f",([UIScreen mainScreen].bounds.size.width - 60) / 5);
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    //添加集合视图
    [self addSubview:_collectionV];
    
    //注册对应的cell
    [_collectionV registerClass:[EMMHomeCollectionViewCell class] forCellWithReuseIdentifier:eMMHomeColectionCell];
    
}

#pragma mark CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagesArr.count;
}

//返回每一个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EMMHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:eMMHomeColectionCell forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:_imagesArr[indexPath.row]];
    cell.title.text = _titleArr[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YHLog(@"点击了：%ld", (long)indexPath.row);
}

@end
