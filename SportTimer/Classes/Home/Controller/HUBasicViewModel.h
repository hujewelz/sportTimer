//
//  HUViewModel.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, HUViewModelLoadType) {
    HUViewModelLoadTypeLoadNew,  //刷新 default
    HUViewModelLoadTypeLoadMore  //分页
};

typedef NS_ENUM(NSInteger, HUResponseStatus) {
    HUResponseStatusFailed,
    HUResponseStatusSucceed
};



@class HUBasicViewModel;
@protocol HUBasicViewModelDelegate <NSObject>

@optional
- (void)viewModelDidFetchDataSucceed:(HUBasicViewModel *)viewModel;

- (void)viewModel:(HUBasicViewModel *)viewModel didFailedWithErrorMsg:(NSString *)error;

@end

@interface HUBasicViewModel : NSObject

@property (nonatomic,readonly, strong) id model;

@property (nonatomic,readonly, copy) void(^successBlock)(id viewModel);

@property (nonatomic,readonly, copy) void(^failedBlock)(id msg);

@property (nonatomic, weak) id <HUBasicViewModelDelegate> delegate;

@property (nonatomic) HUViewModelLoadType loadType;

/**
 * 设置网络状态状态，默认为 YES
 */
@property (nonatomic) BOOL networkingReachable;

/**
 * @bref 服务器返回的状态
 */
@property (nonatomic, readonly) HUResponseStatus status;

/**
 * 服务器返回的信息
 */
@property (nonatomic,readonly, copy) NSString *responseMsg;


/**
 * 通过一个model创建对象
 */

- (instancetype)initWithModel:(id)model;

/**
 * 通过此方法获取数据，在Block中处理结果
 */

- (void)fetchDataSuccess:(void(^)(id viewModel))success
                 failure:(void(^)(NSString *msg))failure;

/**
 * 通过此方法获取数据，在代理中处理结果
 */

- (void)fetchData;

/**
 * 在此方法中做数据清理工作，例如取消网络请求
 */
- (void)cancel;

@end

//@interface HUBaskViewModel (NetworkRequest)
//
//
//@end

