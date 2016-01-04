//
//  HUViewModel.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUBasicViewModel.h"

@interface HUBasicViewModel ()

@property (nonatomic, strong) id model;

@property (nonatomic, copy) void(^successBlock)(id viewModel);

@property (nonatomic, copy) void(^failedBlock)(id msg);

@end

@implementation HUBasicViewModel

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self == nil) return nil;
    
    _model = model;
    _networkingReachable = YES;
    
    [self addObserver:self forKeyPath:@"loadType" options:NSKeyValueObservingOptionNew context:nil];
    
    return self;

}

- (instancetype)init {
    return [self initWithModel:nil];
}

- (void)dealloc {

    [self removeObserver:self forKeyPath:@"loadType"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"loadType"]) {
        
        if (self.successBlock) {
            [self fetchDataSuccess:self.successBlock failure:self.failedBlock];
        }
        else {
            [self fetchData];
        }
    }
}

- (void)fetchDataSuccess:(void(^)(id viewModel))success
                 failure:(void(^)(NSString *msg))failure {
    if (!self.successBlock) {
        self.successBlock = [success copy];
    }
    if (!self.failedBlock) {
        self.failedBlock = [failure copy];
    }
    
}

- (void)fetchData {};

- (void)cancel {};

@end
