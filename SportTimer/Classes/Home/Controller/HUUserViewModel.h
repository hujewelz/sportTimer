//
//  HUViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HURequestViewModel.h"
#import "HUUser.h"

@interface HUUserViewModel : HURequestViewModel

@property (nonatomic, copy) NSString *name;



- (void)cancel;

//- (void)fetchDataSuccess:(void(^)(HUUserViewModel *viewModel))success failure:(void(^)(NSString *msg))failure;

@end
