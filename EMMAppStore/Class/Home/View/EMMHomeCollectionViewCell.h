//
//  EMMHomeCollectionViewCell.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/24.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMMHomeCollectionViewCell : UICollectionViewCell

/**
 * 商品的缩略图
 */
@property (nonatomic, strong) UIImageView *imageView;
/**
 * 商品的名称
 */
@property (nonatomic, strong) UILabel *title;

@end
