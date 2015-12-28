//
//  HUViewModel.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUViewModel.h"

@implementation HUViewModel

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self == nil) return nil;
    
    _model = model;
    _networkingReachable = YES;
    
    return self;
    
}

- (instancetype)init {
    if (self = [super init]) {
        _networkingReachable = YES;
    }
    return self;
}

- (void)fetchDataSuccess:(void(^)(HUViewModel *viewModel))success failure:(void(^)(NSString *msg))failure {}
@end
