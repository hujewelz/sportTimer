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
    HUUser *_user;
}

@end

@implementation HUUserViewModel

- (instancetype)initWith:(HUUser *)user {
    self = [super init];
    if (self == nil) return nil;
    
    _user = user;
    
    return self;
}

- (void)fetchDataSuccess:(void (^)(HUViewModel *))success failure:(void (^)(NSString *))failure {
    
    BOOL isnetwork = self.networkingReachable;
    if (!isnetwork) {
        _user = [HULocalizationApi querry:_user];
        if (_user) {
            success(self);
        } else {
            failure(@"没有信息");
        }
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"HomeMeNext1Servlet?userid=%zd",_user.userId.intValue];
    [HUNetworkingApi GET:url success:^(NSURLSessionDataTask *task, id responseObject) {
        //NSLog(@"response: %@",responseObject);
        HUUser *newUser = [[HUUser alloc] init];
        
        NSDictionary *user = responseObject[@"user"];
        newUser.userId = user[@"id"];
        newUser.name = user[@"phone"];
        newUser.gender = 1;
        newUser.age = 23;
        
        _user = newUser;
        
        success(self);
        
        //[_user add];
        [HULocalizationApi saveObjec:_user];
        // [[DBMaster sharedDBMaster] addUser:_user];
        
    } failure:^(NSURLSessionDataTask *task, NSString *error) {
        failure(error);
    }];
    

}

- (NSString *)name {
    
    return _user.name;
}

@end
