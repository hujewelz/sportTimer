//
//  HUTabBar.h
//  SportTimer
//
//  Created by mac on 15/12/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUTabBar : UITabBar

- (void)didSelecteItemCompletion:(void (^)(NSInteger selectedIndx))completion;

@end
