//
//  HUUser.m
//  FMDBTest
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUUser.h"
#import "DBMaster.h"
#import "HULocalizationApi.h"


@implementation HUUser

- (NSString *)description {
    NSString *gender = self.gender == 1 ? @"男" : @"女";
    return [NSString stringWithFormat:@"id: %zd, naem: %@, gender: %@, age: %zd",self.userId.integerValue, self.name, gender, self.age];
}


- (BOOL)save {
    
    HUUser *old = [self querry];
    if (old.userId.integerValue == _userId.integerValue) {
      return [[DBMaster sharedDBMaster] runSql:@"UPDATE user SET name=?,gender=?,age=? WHERE userid=?", self.name, @(self.gender), @(self.age+70),_userId];
    }
    else {
    
       return [[DBMaster sharedDBMaster] runSql:@"INSERT INTO user(userid,name,gender,age) VALUES(?,?,?,?)",self.userId, self.name, @(self.gender), @(self.age)];
    }
    
   // NSString *sql = [NSString stringWithFormat:@"UPDATE user SET name='%@',gender=%zd,age=%zd WHERE userid=%zd", self.name, self.gender, self.age+20,_userId.integerValue];
    //[[DBMaster sharedDBMaster] runSql:@"UPDATE user SET name=?,gender=?,age=? WHERE userid=?", self.name, @(self.gender), @(self.age+40),_userId];
    
    
    //[[DBMaster sharedDBMaster] insertSql:@"UPDATE user SET name= ?"];
}

- (id)querry {
    NSString *sql = [NSString stringWithFormat:@"SELECT userid,name, gender, age FROM user WHERE userid=%zd", _userId.intValue];
    
    FMResultSet *result = [[DBMaster sharedDBMaster] query:sql];
    HUUser *user = [[HUUser alloc] init];
    if ([result next]) {
        
        user.userId = @([result intForColumn:@"userid"]);
        user.name = [result stringForColumn:@"name"];
        user.gender = [result intForColumn:@"gender"];
        user.age = [result intForColumn:@"age"];
    }
    [result close];
    NSLog(@"querry: %@", user.description);
    return user;
}

@end
