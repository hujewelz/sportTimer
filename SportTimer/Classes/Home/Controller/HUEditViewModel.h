//
//  HUEditViewModel.h
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUBasicViewModel.h"

@interface HUEditViewModel : HUBasicViewModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic) NSInteger gender;

- (void)save;

@end
