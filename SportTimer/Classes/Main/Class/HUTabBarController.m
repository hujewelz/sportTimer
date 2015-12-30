//
//  WBTabBarController.m
//  微博
//
//  Created by jewelz on 15/4/23.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUTabBarController.h"
#import "HUNavigationController.h"
#import "ViewController.h"
#import "HUTabBar.h"



@interface HUTabBarController ()

@end

@implementation HUTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBar.barTintColor = kDefaultColor;
    
    UIViewController *vc1 = [[ViewController alloc] init];
    [self addChildViewController:vc1 withTitle:nil image:@"tab_home_selected" andSelectedImage:@"tab_home"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:vc2 withTitle:@"发现" image:@"tab_descorver" andSelectedImage:@"tab_descorver_s"];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
     vc3.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:vc3 withTitle:@"动态圈" image:@"tab_dymanic" andSelectedImage:@"tab_dymanic_s"];
    
//    UIViewController *vc4 = [[MADDescoverViewController alloc] init];
//    [self addChildViewController:vc4 withTitle:@"模戒" image:@"tab_model" andSelectedImage:@"tab_mode_s"];
//    
//    
//    UIViewController *vc5 = [[MAProfileViewController alloc] init];
//    [self addChildViewController:vc5 withTitle:@"我" image:@"tab_profile" andSelectedImage:@"tab_profile_s"];
    HUTabBar *tabBar = [[HUTabBar alloc] init];
    //[tabBar addTarget:self action:@selector(presentCompose)];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    [tabBar didSelecteItemCompletion:^(NSInteger selectedIndx) {
        self.selectedIndex = selectedIndx;
    }];
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(NSString *)image andSelectedImage:(NSString *)selectedImage{
    //childController.title = title;
   // childController.view.backgroundColor = [self randomColor];
    
    //childController.tabBarItem.image = [UIImage imageNamed:image];
    
    //设置选择的图片 imageWithRenderingMode设置图片渲染模式 UIImageRenderingModeAlwaysOriginal：不渲染
    //childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    NSDictionary *attributeNormal = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
//    NSDictionary *attributeSelected = @{NSForegroundColorAttributeName:kDefaultColor};
//    [childController.tabBarItem setTitleTextAttributes:attributeNormal forState:UIControlStateNormal];
//    [childController.tabBarItem setTitleTextAttributes:attributeSelected forState:UIControlStateSelected];
    
    
    [self addChildViewController:[[HUNavigationController alloc] initWithRootViewController:childController]];
}




@end
