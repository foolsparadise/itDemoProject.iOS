//
//  TabBarDemo1ViewController.m
//  DemoProject
//
//  Created by foolsparadise on 21/2/2020.
//  Copyright © 2020 github.com/foolsparadise All rights reserved.
//

#import "TabBarDemo1ViewController.h"
#import "AppRootViewController.h"
#import "ViewController.h"

@interface TabBarDemo1ViewController ()

@end

@implementation TabBarDemo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    itNSLog(@"TabBarDemo1ViewController viewDidLoad");
    self.view.backgroundColor = [UIColor redColor];
    // 设置navigationItem左右item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change Item" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClicked)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Goto 2nd" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClicked)];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)leftBarButtonItemClicked {
    // 重新设置tabBarItem
    self.tabBarItem.badgeValue = @"99";
    self.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_profile",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile"];
    self.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_profile_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile_selected"];
    self.tabBarItem.title = @"Woo!";
    //    for (UIViewController *vc in ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers) {
    //        itNSLog(@"%@", vc);
    //        vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", vc.tabBarItem.badgeValue.integerValue + 100];
    //    }
    // 计算加减
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[0].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[0].tabBarItem.badgeValue.integerValue + 1];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[1].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[1].tabBarItem.badgeValue.integerValue + 10];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[2].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[2].tabBarItem.badgeValue.integerValue + 100];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[3].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[3].tabBarItem.badgeValue.integerValue + 1000];
    // Key code
    // System will display the original controls so you should call this line when you change any tabBar item
    [(LCTabBarController *)self.tabBarController removeOriginControls];
}

- (void)rightBarButtonItemClicked {
    // 跳转到第2个
    //[(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController setSelectedIndex:1];
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
