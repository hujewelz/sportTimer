//
//  HUEditSportViewController.h
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HUEditViewModel;
@interface HUEditSportViewController : UIViewController

- (instancetype)initWithViewModel:(id)viewModel;
@property (nonatomic, strong) HUEditViewModel *editViewModel;


@end
