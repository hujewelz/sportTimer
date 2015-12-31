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


@class HUBaskViewModel;
@protocol HUBasicViewModelDelegate <NSObject>

@optional
- (void)viewModelDidFetchDataSucceed:(HUBaskViewModel *)viewModel;

- (void)viewModel:(HUBaskViewModel *)viewModel didFailedWithErrorMsg:(NSString *)error;

@end

@interface HUBaskViewModel : NSObject

@property (nonatomic,readonly, strong) id model;

@property (nonatomic,readonly, copy) void(^successBlock)(id viewModel);

@property (nonatomic,readonly, copy) void(^failedBlock)(id msg);

@property (nonatomic, weak) id <HUBasicViewModelDelegate> delegate;

@property (nonatomic) HUViewModelLoadType loadType;

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

