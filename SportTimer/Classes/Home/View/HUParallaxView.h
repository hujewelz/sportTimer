//
//  HUParallaxView.h
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HUParallaxViewDataSoruce <UITableViewDataSource>

@end

@protocol HUParallaxViewDelegate <UITableViewDelegate>

@end

@interface HUParallaxView : UIView

@property (nonatomic, strong) RACSubject *didScrollSignal;

@property (nonatomic, weak) id<HUParallaxViewDataSoruce> dataSource;
@property (nonatomic, weak) id<HUParallaxViewDelegate> delegate;

- (NSInteger)number;

@end
