//
//  HUViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUBasicViewModel.h"
#import "HUUser.h"

@class HUEditViewModel;
@interface HUUserViewModel : HUBasicViewModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) NSInteger sections;


- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)titleForCellAtSection:(NSInteger)section index:(NSInteger)index;

-(HUEditViewModel *)editStepViewModelAtSection:(NSInteger)section;

- (void)addNewItem;

@end
