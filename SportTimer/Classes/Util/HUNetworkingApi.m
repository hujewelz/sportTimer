//
//  HUNetworkingApi.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUNetworkingApi.h"
#import <AFNetworking/AFNetworking.h>

@interface HUNetworkingApi () {

    
}

@property (nonatomic, strong) AFHTTPSessionManager *httpSession;
@property (nonatomic, strong) NSString *basicURL;

@end

@implementation HUNetworkingApi

+ (instancetype)sharedNetworking {
    static HUNetworkingApi *networkingApi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkingApi = [[HUNetworkingApi alloc] init];
    });
    return networkingApi;
}

- (instancetype)init {
    self = [super init];
    if (self == nil) return nil;

    AFHTTPSessionManager *httpSession = [AFHTTPSessionManager manager];
    httpSession.requestSerializer.timeoutInterval = 30.0f;
    httpSession.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json",@"text/javascript", nil];
    _httpSession = httpSession;
    
    _basicURL = @"http://192.168.0.3:8080/MoJieServer/";
    
    return self;
}

+ (void)cancel {
    [[HUNetworkingApi sharedNetworking].httpSession.tasks makeObjectsPerformSelector:@selector(cancel)];
   // [[HUNetworkingApi sharedNetworking].httpSession invalidateSessionCancelingTasks:NO];
}

+ (void)GET:(NSString *)URLString
    success:(SuccessBlock)success
    failure:(FailureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",[HUNetworkingApi sharedNetworking].basicURL, URLString];
    [[HUNetworkingApi sharedNetworking].httpSession GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [task cancel];
        success(task, responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        NSString *errorMsg = [self errorMsgFromeErrorMsg:error.userInfo[NSLocalizedDescriptionKey]];
        failure(task, errorMsg);
    }];
    
}

+ (void)POST:(NSString *)URLString
  parameters:(NSDictionary *)parameters
     success:(SuccessBlock)success
     failure:(FailureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",[HUNetworkingApi sharedNetworking].basicURL, URLString];
    [[HUNetworkingApi sharedNetworking].httpSession POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
         NSString *errorMsg = [self errorMsgFromeErrorMsg:error.userInfo[NSLocalizedDescriptionKey]];
         failure(task, errorMsg);
    }];
}

+ (void)uploadWithPOST:(NSString *)URLString
            parameters:(id)parameters
                 datas:(NSArray *)datas
              fileName:(NSArray *)fileName
               success:(SuccessBlock)success
               failure:(FailureBlock)failure {
    NSString *url = [NSString stringWithFormat:@"%@%@",[HUNetworkingApi sharedNetworking].basicURL, URLString];
    
    [[HUNetworkingApi sharedNetworking].httpSession POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [datas enumerateObjectsUsingBlock:^(NSData *data, NSUInteger idx, BOOL *stop) {
            
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:[NSString stringWithFormat:@"yyMMddHHmmss"]];
            
            NSString *filename = [NSString stringWithFormat:@"%@%zd.png", [formatter stringFromDate:date],idx];
            [formData appendPartWithFileData:data name:@"image" fileName:filename mimeType:@"image/png"];
            
        }];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(task, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    
        NSString *errorMsg = [self errorMsgFromeErrorMsg:error.userInfo[NSLocalizedDescriptionKey]];
        failure(task, errorMsg);
    }];
    
}

+ (NSString *)errorMsgFromeErrorMsg:(NSString *)errorMsg {
    NSString *error = @"连接超时";
    if ([errorMsg isEqualToString:@"The request timed out."]) {
        error = @"连接超时";
    }
    else if ([errorMsg isEqualToString:@"Could not connect to the server."]) {
        error = @"服务器开了点小差，先休息下吧";
    }
    
    return error;
}

@end
