//
//  HURequestViewModel.m
//  SportTimer
//
//  Created by mac on 15/12/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HURequestViewModel.h"

@implementation HURequestViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    _networkingReachable = YES;
    
    return self;
    
}

- (instancetype)init {
    if (self = [super init]) {
        _networkingReachable = YES;
    }
    return self;
}

@end
