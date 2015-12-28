//
//  HUViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUViewModel : NSObject

- (instancetype)initWithModel:(id)model;
- (void)fetchDataSuccess:(void(^)(HUViewModel *viewModel))success failure:(void(^)(NSString *msg))failure;

@property (nonatomic, strong) id model;

@property (nonatomic) BOOL networkingReachable;

@end
