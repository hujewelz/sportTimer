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
#import "DBMaster.h"
#import "HUEditViewModel.h"

@interface HUUserViewModel ()<HULocalizationProtocol> {
    NSArray *_results;
}
@property (nonatomic, readwrite) NSInteger sections;

@end

@implementation HUUserViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self) {
        _results = [NSArray array];
    }
    return self;
}

- (void)fetchData {
    
    [self fetchDataSuccess:^(HUBasicViewModel *viewModel) {
        if ([self.delegate respondsToSelector:@selector(viewModelDidFetchDataSucceed:)]) {
            [self.delegate viewModelDidFetchDataSucceed:self];
        }

    } failure:^(NSString *msg) {
        if ([self.delegate respondsToSelector:@selector(viewModel:didFailedWithErrorMsg:)]) {
            [self.delegate viewModel:self didFailedWithErrorMsg:msg];
        }
    }];
    
}


- (void)fetchDataSuccess:(void (^)(id))success failure:(void (^)(NSString *))failure {
    
    [super fetchDataSuccess:success failure:failure];
    
    _results = [HULocalizationApi querryAll:self];
    self.sections = _results.count;
    success(self);
    
//    HUUser *user = (HUUser *)self.model;
//    
//    BOOL isnetwork = self.networkingReachable;
//    if (!isnetwork) {
//        user = [HULocalizationApi querry:user];
//        if (user) {
//            self.name = user.name;
//            success(self);
//        } else {
//            failure(@"没有信息");
//        }
//        return;
//    }
//    
//    
//    NSString *url = [NSString stringWithFormat:@"HomeMeNext1Servlet?userid=%zd",user.userId.intValue];
//    [HUNetworkingApi GET:url success:^(NSURLSessionDataTask *task, id responseObject) {
//       // NSLog(@"response: %@",responseObject);
//        HUUser *newUser = [[HUUser alloc] init];
//        
//        NSDictionary *user = responseObject[@"user"];
//        newUser.userId = user[@"id"];
//        newUser.name = user[@"phone"];
//        newUser.gender = 1;
//        newUser.age = 23;
//        
//        //_user = newUser;
//        self.name = newUser.name;
//        
//        if (success) {
//            success(self);
//        }
//        
//        //[_user add];
//        [HULocalizationApi saveObjec:newUser];
//        // [[DBMaster sharedDBMaster] addUser:_user];
//        
//    } failure:^(NSURLSessionDataTask *task, NSString *error) {
//        if (failure) {
//            failure(error);
//        }
//        
//    }];
    

}

- (id)querryAll {
    NSString *sql = [NSString stringWithFormat:@"SELECT userid,name, gender, age FROM user "];
    
    FMResultSet *result = [[DBMaster sharedDBMaster] query:sql];
    NSMutableArray *array = [NSMutableArray array];
    while ([result next]) {
        HUUser *user = [[HUUser alloc]  init];
        user.userId = @([result intForColumn:@"userid"]);
        user.name = [result stringForColumn:@"name"];
        user.gender = [result intForColumn:@"gender"];
        user.age = [result intForColumn:@"age"];
        [array addObject:user];
    }
    [result close];
    //NSLog(@"result: %@",array);
    return array;
}

- (void)cancel {
    [HUNetworkingApi cancel];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSString *)titleForCellAtSection:(NSInteger)section index:(NSInteger)index {
    NSString *title = nil;
    HUUser *user = _results[section];
    switch (index) {
        case 0:
            title = user.name;
            break;
        case 1: {
            NSString *gender = user.gender == 1 ? @"男" : @"女";
            title = gender;
        }
            break;
        case 2:
            title = [NSString stringWithFormat:@"年龄：%zd",user.age];
            break;
        default:
            break;
    }
    return title;
}

- (void)addNewItem {
    HUUser *newUser = [[HUUser alloc]  init];
    newUser.userId = @(100+self.sections);
    newUser.name = newUser.userId.description;
    [HULocalizationApi saveObjec:newUser];
    
    NSMutableArray *array = [_results mutableCopy];
    [array addObject:newUser];
    
    _results = [array copy];
    self.sections = _results.count;
}

- (HUEditViewModel *)editStepViewModelAtSection:(NSInteger)section {
    HUUser *user = _results[section];
    HUEditViewModel *viewModel = [[HUEditViewModel alloc] initWithModel:user];
    
    return viewModel;
}

@end
