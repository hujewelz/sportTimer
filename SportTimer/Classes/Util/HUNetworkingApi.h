//
//  HUNetworkingApi.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask *task, NSString *error);

@interface HUNetworkingApi : NSObject

+ (instancetype)sharedNetworking;

+ (void)GET:(NSString *)URLString
    success:(SuccessBlock)success
    failure:(FailureBlock)failure;

+ (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(SuccessBlock)success
     failure:(FailureBlock)failure;


+ (void)uploadWithPOST:(NSString *)URLString
            parameters:(id)parameters
                 datas:(NSArray *)datas
              fileName:(NSArray *)fileName
               success:(SuccessBlock)success
               failure:(FailureBlock)failure;

@end
