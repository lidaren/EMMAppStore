//
//  EMMMeViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2016/11/15.
//  Copyright © 2016年 GZYY. All rights reserved.
//

#import "EMMMeViewController.h"
#import "EMMLoginViewController.h"
#import "MainNavigationController.h"
#import "EMMAboutMeViewController.h"

@interface EMMMeViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) UIScrollView *backGroundView;

/**
 显示内容的TableView
 */
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

/**
 装载的数据
 */
@property (nonatomic, strong) NSArray *titleNameArr;
@property (nonatomic, strong) NSArray *imagesArr;


/**
 退出按钮
 */
@property (nonatomic, weak) UIButton *exitButton;

@end

@implementation EMMMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    [self setUpMytableView];
}

#pragma mark -  ============= 私有方法 ===============
- (void)setUpMytableView{
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    _titleNameArr = @[@"已安装应用", @"重置手势密码", @"关于我们"];
    _imagesArr = @[@"icon_yianzhaung", @"icon_reset", @"icon_about"];
    
    // tableHeaderView 的内容
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 130)];
    headerView.backgroundColor = YHColor(114, 194, 212);
    
    UILabel *phoneNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, ScreenW, 20)];
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, ScreenW, 20)];
    
    phoneNum.textColor = [UIColor whiteColor];
    phoneNum.textAlignment = NSTextAlignmentCenter;
    userName.textColor = [UIColor whiteColor];
    userName.textAlignment = NSTextAlignmentCenter;
    
    phoneNum.text = @"18022223333";
    userName.text = @"张大东";
    
    [headerView addSubview:phoneNum];
    [headerView addSubview:userName];
    
    _myTableView.tableHeaderView = headerView;
    
    // tableFooterView 的内容
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    UIButton *exitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    
    [exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [exitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [exitBtn setBackgroundColor:[UIColor whiteColor]];
    
    _exitButton = exitBtn;
    [_exitButton addTarget:self action:@selector(exitBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:_exitButton];
    _myTableView.tableFooterView = footerView;
    
}

- (void)exitBtnOnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出应用程序" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"取消");
    }];
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"确定"style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        UINavigationController *loginNavCtl = [[MainNavigationController alloc] initWithRootViewController:[[EMMLoginViewController alloc]init]];
        [UIApplication sharedApplication].keyWindow.rootViewController = loginNavCtl;
    }];
    [alert addAction:defaultAction];
    [alert addAction:defaultAction2];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

#pragma mark -  ============= UITableView数据源和代理方法 ===============
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleNameArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = _titleNameArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imagesArr[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            // 已经安装应用
            break;
        case 1:
            // 重置手势密码
            [self resetGesturePassWord];
            break;
        default:
            // 关于我们
            [self.navigationController pushViewController:[[EMMAboutMeViewController alloc] init] animated:YES];
            break;
    }
}

/**
 修改手势密码
 */
- (void)resetGesturePassWord{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入以下账号的密码" message:@"18022223333" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
        textField.delegate = self;
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - ********** UITextFieldDelegate **********
- (void)textFieldDidEndEditing:(UITextField *)textField{
    YHLog(@"%@", textField.text);
}

@end
