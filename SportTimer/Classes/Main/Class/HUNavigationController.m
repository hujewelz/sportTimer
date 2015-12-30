//
//  WBNavigationController.m
//  微博
//
//  Created by jewelz on 15/4/23.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUNavigationController.h"

@interface HUNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HUNavigationController

+ (void)initialize {
    //设置title颜色
    NSDictionary *titleAttribute = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttribute];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置正常状态
    NSDictionary *attribute = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]};
    [item setTitleTextAttributes:attribute forState:UIControlStateNormal];
    [item setTitleTextAttributes:attribute forState:UIControlStateHighlighted];
    
    //设置不可用状态
    NSDictionary *disAttribute = @{NSForegroundColorAttributeName:HUColor(209, 209, 209,1), NSFontAttributeName:[UIFont systemFontOfSize:14]};
    [item setTitleTextAttributes:disAttribute forState:UIControlStateDisabled];
    
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbar_bg"] forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UINavigationBar appearance].translucent = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置滑动手势代理
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem leftItemWithTarget:self action:@selector(back) image:@"nav_back" highLighted:@"nav_back"];
        
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTarget:self action:@selector(more) image:@"nav_share" highLighted:@"nav_share"];
        
    }
    [super pushViewController:viewController animated:YES];
}

- (void)back {

    if ([self.visibleViewController respondsToSelector:NSSelectorFromString(@"customBackAction")]) {
        [self.visibleViewController performSelector:NSSelectorFromString(@"customBackAction") withObject:nil];
    } else {
        [self.view endEditing:YES];
        [self popViewControllerAnimated:YES];
    }
    
}

- (void)more {
    [self popToRootViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count == 1) { //关闭右滑手势
        return NO;
    }
    //NSLog(@"gesture");
    return YES;
}


@end
