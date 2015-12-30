//
//  HUViewModel.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUUserViewModel.h"
#import "HUNetworkingApi.h"
#import "HULocalizationApi.h"

@interface HUUserViewModel () {
    //HUUser *_user;
}

@end

@implementation HUUserViewModel

//- (instancetype)initWithModel:(id)model {
//    self = [super initWithModel:model];
//    if (self == nil) return nil;
//    
//    return self;
//}

- (void)dealloc {
     NSLog(@"%s, %@", sel_getName(_cmd), self);
    //[self removeObserver:self forKeyPath:@"loadType"];
}



- (void)fetchData {
    
    [self fetchDataSuccess:^(HUBaskViewModel *viewModel) {
        if ([self.delegate respondsToSelector:@selector(viewModelDidFetchDataSucceed:)]) {
            [self.delegate viewModelDidFetchDataSucceed:self];
        }

    } failure:^(NSString *msg) {
        if ([self.delegate respondsToSelector:@selector(viewModel:didFailedWithErrorMsg:)]) {
            [self.delegate viewModel:self didFailedWithErrorMsg:msg];
        }
    }];
    
}


- (void)fetchDataSuccess:(void (^)(HUBaskViewModel *))success failure:(void (^)(NSString *))failure {
    
    [super fetchDataSuccess:success failure:failure];
    
    HUUser *user = (HUUser *)self.model;
    
    BOOL isnetwork = self.networkingReachable;
    if (!isnetwork) {
        user = [HULocalizationApi querry:user];
        if (user) {
            self.name = user.name;
            success(self);
        } else {
            failure(@"没有信息");
        }
        return;
    }
    
    
    NSString *url = [NSString stringWithFormat:@"HomeMeNext1Servlet?userid=%zd",user.userId.intValue];
    [HUNetworkingApi GET:url success:^(NSURLSessionDataTask *task, id responseObject) {
       // NSLog(@"response: %@",responseObject);
        HUUser *newUser = [[HUUser alloc] init];
        
        NSDictionary *user = responseObject[@"user"];
        newUser.userId = user[@"id"];
        newUser.name = user[@"phone"];
        newUser.gender = 1;
        newUser.age = 23;
        
        //_user = newUser;
        self.name = newUser.name;
        
        if (success) {
            success(self);
        }
        
        //[_user add];
        [HULocalizationApi saveObjec:newUser];
        // [[DBMaster sharedDBMaster] addUser:_user];
        
    } failure:^(NSURLSessionDataTask *task, NSString *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    

}

- (void)cancel {
    [HUNetworkingApi cancel];
}

@end
