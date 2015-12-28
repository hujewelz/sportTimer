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

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    //_user = user;
    
    return self;
}

- (void)fetchDataSuccess:(void (^)(HUViewModel *))success failure:(void (^)(NSString *))failure {
    
    BOOL isnetwork = self.networkingReachable;
    if (!isnetwork) {
        self.model = [HULocalizationApi querry:self.model];
        if (self.model) {
            success(self);
        } else {
            failure(@"没有信息");
        }
        return;
    }
    
    HUUser *user = (HUUser *)self.model;
    NSString *url = [NSString stringWithFormat:@"HomeMeNext1Servlet?userid=%zd",user.userId.intValue];
    [HUNetworkingApi GET:url success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"response: %@",responseObject);
        HUUser *newUser = [[HUUser alloc] init];
        
        NSDictionary *user = responseObject[@"user"];
        newUser.userId = user[@"id"];
        newUser.name = user[@"phone"];
        newUser.gender = 1;
        newUser.age = 23;
        
        //_user = newUser;
        self.name = newUser.name;
        
        success(self);
        
        //[_user add];
        [HULocalizationApi saveObjec:newUser];
        // [[DBMaster sharedDBMaster] addUser:_user];
        
    } failure:^(NSURLSessionDataTask *task, NSString *error) {
        failure(error);
    }];
    

}

- (void)cancel {
    [HUNetworkingApi cancel];
}

@end
