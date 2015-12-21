//
//  MainTabViewController.m
//  EAIntroView
//
//  Created by CSB on 15/12/19.
//  Copyright © 2015年 SampleCorp. All rights reserved.
//

#import "MainTabViewController.h"
#import "WebViewController.h"
#import "StoryboadUtil.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
//    UITabBarItem *tabbarItem1 =  [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:1];
//    
//    UITabBarItem *tabbarItem2 =  [[UITabBarItem alloc] initWithTitle:@"逛街" image:nil tag:2];
//    
//    UITabBarItem *tabbarItem3 =  [[UITabBarItem alloc] initWithTitle:@"客服" image:nil tag:3];
//    
//    UITabBarItem *tabbarItem4 =  [[UITabBarItem alloc] initWithTitle:@"购物车" image:nil tag:4];
//    
//    UITabBarItem *tabbarItem5 =  [[UITabBarItem alloc] initWithTitle:@"个人中心" image:nil tag:5];
//    
//    self.tabBar.items = [NSArray arrayWithObjects:tabbarItem1,tabbarItem2,tabbarItem3,tabbarItem4,tabbarItem5, nil];

    WebViewController *webViewController1 = [StoryboadUtil getViewController:@"Main" :@"WebViewController"];
    webViewController1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"sy"] tag:1];
    [webViewController1 setUrl:@"http://www.99tx.com/wap/"];
    webViewController1.isNeedRefresh = false;
    webViewController1.isNeedResetAgent = true;
    
    WebViewController *webViewController2 = [StoryboadUtil getViewController:@"Main" :@"WebViewController"];
    webViewController2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"逛街" image:[UIImage imageNamed:@"gj"] tag:1];
    [webViewController2 setUrl:@"http://www.99tx.com/wap/special.html?special_id=4"];
    webViewController2.isNeedRefresh = false;
    webViewController1.isNeedResetAgent = true;
    
    WebViewController *webViewController3 = [StoryboadUtil getViewController:@"Main" :@"WebViewController"];
    webViewController3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"客服" image:[UIImage imageNamed:@"kf"] tag:1];
    [webViewController3 setUrl:@"http://wpa.qq.com/msgrd?v=3&uin=909972273&site=qq&menu=yes"];
    webViewController3.isNeedRefresh = true;
    webViewController1.isNeedResetAgent = false;
    
    WebViewController *webViewController4 = [StoryboadUtil getViewController:@"Main" :@"WebViewController"];
    webViewController4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:[UIImage imageNamed:@"gwc"] tag:1];
    [webViewController4 setUrl:@"http://www.99tx.com/wap/tmpl/cart_list.html"];
    webViewController4.isNeedRefresh = true;
    webViewController1.isNeedResetAgent = true;
    
    WebViewController *webViewController5 = [StoryboadUtil getViewController:@"Main" :@"WebViewController"];
    webViewController5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:[UIImage imageNamed:@"ren"] tag:1];
    [webViewController5 setUrl:@"http://www.99tx.com/wap/tmpl/member/member.html?act=member"];
    webViewController5.isNeedRefresh = true;
    webViewController1.isNeedResetAgent = true;
    
    self.viewControllers = [NSArray arrayWithObjects:webViewController1,webViewController2,webViewController3,webViewController4,webViewController5, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}

@end
