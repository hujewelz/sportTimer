//
//  UIBarButtonItem+Extension.m
//  微博
//
//  Created by jewelz on 15/4/24.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
static const CGSize BUTTON_SIZE = {60, 40};

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage {
    UIButton *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)leftItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage {
    
    UIButton *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage {
    
    UIButton *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    

    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIButton *)buttonWithImage:(NSString *)image highLighted:(NSString *)highImage {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //[btn setBackgroundColor:[UIColor redColor]];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.size = BUTTON_SIZE;
    return btn;
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title {
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
}

@end
