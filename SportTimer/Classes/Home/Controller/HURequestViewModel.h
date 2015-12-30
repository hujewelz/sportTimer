//
//  HURequestViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/30.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUBaskViewModel.h"

typedef NS_ENUM(NSInteger, HUResponseStatus) {
    HUResponseStatusFailed,
    HUResponseStatusSucceed
};


@interface HURequestViewModel : HUBaskViewModel

/**
 * 设置网络状态状态，默认为 YES
 */
@property (nonatomic) BOOL networkingReachable;

/**
 * @bref 服务器返回的状态
 */
@property (nonatomic) HUResponseStatus status;

/**
 * 服务器返回的信息
 */
@property (nonatomic, copy) NSString *responseMsg;


@end
