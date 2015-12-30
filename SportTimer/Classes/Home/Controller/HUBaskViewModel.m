//
//  HUViewModel.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUBaskViewModel.h"

@implementation HUBaskViewModel

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self == nil) return nil;
    
    _model = model;
    
    [self addObserver:self forKeyPath:@"loadType" options:NSKeyValueObservingOptionNew context:nil];
    
    return self;

}

- (void)dealloc {
    NSLog(@"%s,----- %@", sel_getName(_cmd), self);
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

- (void)fetchDataSuccess:(void(^)(HUBaskViewModel *viewModel))success
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
