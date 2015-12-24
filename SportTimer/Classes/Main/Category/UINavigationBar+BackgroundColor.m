//
//  UINavigationBar+BackgroundColor.m
//  DynamicNavigationBar
//
//  Created by jewelz on 15/4/12.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "UINavigationBar+BackgroundColor.h"
#import <objc/runtime.h>
static void *MyViewKey = "MyViewKey";

@implementation UINavigationBar (BackgroundColor)

- (UIView *)overlay {
    return objc_getAssociatedObject(self, MyViewKey);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, MyViewKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hu_setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

@end

