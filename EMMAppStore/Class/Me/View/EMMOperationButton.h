//
//  EMMOperationButton.h
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/20.
//  Copyright © 2017年 GZYY. All rights reserved.
//
//  可以长按删除、移动的Button

#import <UIKit/UIKit.h>

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//每个格子的高度
#define GridHeight 123
//每行显示格子的列数
#define PerRowGridCount 4
//每列显示格子的行数
#define PerColumGridCount 2
//每个格子的宽度
#define GridWidth (ScreenWidth/PerRowGridCount)
//每个格子的X轴间隔
#define PaddingX 0
//每个格子的Y轴间隔
#define PaddingY 0

@protocol EMMOperationButtonDelegate;

@interface EMMOperationButton : UIButton
//格子的ID
@property(nonatomic, assign)NSInteger gridId;

//格子的title
@property(nonatomic, strong)NSString *gridTitle;
//格子的图片
@property(nonatomic, strong)NSString *gridImageString;

//格子的选中状态
@property(nonatomic, assign)BOOL      isChecked;
//格子的移动状态
@property(nonatomic, assign)BOOL      isMove;
//格子的排列索引位置
@property(nonatomic, assign)NSInteger gridIndex;
//格子的位置坐标
@property(nonatomic, assign)CGPoint   gridCenterPoint;
//代理方法
@property(nonatomic, weak)id<EMMOperationButtonDelegate> delegate;

/**
 * 创建格子
 * @param gridId   格子的ID
 * @param index    格子所在位置的索引下标
 * @param isAddDelete 是否增加删除图标
 */
- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
        normalImage:(UIImage *)normalImage
   highlightedImage:(UIImage *)highlightedImage
             gridId:(NSInteger)gridId
            atIndex:(NSInteger)index
        isAddDelete:(BOOL)isAddDelete
         deleteIcon:(UIImage *)deleteIcon
      withIconImage:(NSString *)imageString;

//根据格子的坐标计算格子的索引位置
+ (NSInteger)indexOfPoint:(CGPoint)point
               withButton:(UIButton *)btn
                gridArray:(NSMutableArray *)gridListArray;

@end

@protocol EMMOperationButtonDelegate <NSObject>

//响应格子的点击事件
- (void)gridItemDidClicked:(EMMOperationButton *)clickItem;

//响应格子删除事件
- (void)gridItemDidDeleteClicked:(UIButton *)deleteButton;

//响应格子的长安手势事件
- (void)pressGestureStateBegan:(UILongPressGestureRecognizer *)longPressGesture withGridItem:(EMMOperationButton *) grid;

- (void)pressGestureStateChangedWithPoint:(CGPoint) gridPoint gridItem:(EMMOperationButton *) gridItem;

- (void)pressGestureStateEnded:(EMMOperationButton *) gridItem;

@end
