//
//  HUViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUViewModel.h"
#import "HUUser.h"

@interface HUUserViewModel : HUViewModel

@property (nonatomic, copy) NSString *name;

//- (instancetype)initWith:(HUUser *)user;

- (void)cancel;

//- (void)fetchDataSuccess:(void(^)(HUUserViewModel *viewModel))success failure:(void(^)(NSString *msg))failure;

@end
