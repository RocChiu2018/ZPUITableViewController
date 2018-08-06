//
//  ZPTableViewController.m
//  UITableViewController
//
//  Created by apple on 16/5/17.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 这个视图控制器已经默认遵守了<UITableViewDataSource>和<UITableViewDelegate>协议了；
 这个视图控制器已经包含了UITableView控件了；
 */
#import "ZPTableViewController.h"

@interface ZPTableViewController ()

@end

@implementation ZPTableViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     设置UITableView控件分割线的颜色
     */
    self.tableView.separatorColor = [UIColor redColor];
    
    /**
     隐藏UITableView控件的分割线
     */
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)  //偶数行
    {
        /**
         系统先去缓存池中去找带有特殊标识符的cell，如果没有找到的话就去storyboard文件中去找带有特殊标识符的cell，如果找到的话系统就会自动创建这个带有特殊标识符的新的原生的cell。
         */
        NSString *ID = @"cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        cell.textLabel.text = [NSString stringWithFormat:@"偶数行--%zd", indexPath.row];
        
        /**
         可以利用cell的accessoryType属性来设置cell右端的系统自带的几种样式的附加视图。
         */
//        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        
        /**
         可以利用cell的accessoryView属性来设置cell右端的自定义的附加视图。
         */
        cell.accessoryView = [[UISwitch alloc] init];
        
        /**
         设置cell正常时的背景颜色：既可以用cell的backgroundView属性设置cell正常时的背景颜色也可以用cell的backgroundColor属性设置cell正常时的背景颜色，二者的区别是backgroundView属性的优先级高于backgroundColor属性的优先级，二者同时存在时取利用backgroundView属性设置的背景颜色。
         */
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor purpleColor];
        cell.backgroundView = bgView;

        cell.backgroundColor = [UIColor greenColor];
        
        /**
         设置cell正常时的背景图片：可以利用cell的backgroundView属性来设置cell正常时的背景图片。
         */
//        UIImageView *bgImageView = [[UIImageView alloc] init];
//        bgImageView.image = [UIImage imageNamed:@"timg"];
//        cell.backgroundView = bgImageView;
        
        /**
         设置cell选中时的背景颜色：可以利用cell的selectedBackgroundView属性来设置cell选中时的背景颜色。
         */
        UIView *selectedBgView = [[UIView alloc] init];
        selectedBgView.backgroundColor = [UIColor redColor];
        cell.selectedBackgroundView = selectedBgView;

        /**
         设置cell选中时的背景图片：可以利用cell的selectedBackgroundView属性来设置cell选中时的背景图片。
         */
//        UIImageView *selectedBgImageView = [[UIImageView alloc] init];
//        selectedBgImageView.image = [UIImage imageNamed:@"scenery"];
//        cell.selectedBackgroundView = selectedBgImageView;

        //取消选中的动画（使之看上去点击没有反应）
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else  //奇数行
    {
        NSString *ID = @"cell2";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        cell.textLabel.text = [NSString stringWithFormat:@"奇数行--%zd", indexPath.row];
        
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
