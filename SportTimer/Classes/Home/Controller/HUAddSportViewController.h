//
//  HUAddSportViewController.h
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HUUserViewModel;
@interface HUAddSportViewController : UIViewController

- (instancetype)initWithViewModel:(id)viewModel;

@property (nonatomic, strong) HUUserViewModel *userViewModel;


@end
