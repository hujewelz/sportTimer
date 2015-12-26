//
//  UIBarButtonItem+Extension.h
//  微博
//
//  Created by jewelz on 15/4/24.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage;
+ (UIBarButtonItem *)leftItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage;
+ (UIBarButtonItem *)rightItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highLighted:(NSString *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title;
@end
