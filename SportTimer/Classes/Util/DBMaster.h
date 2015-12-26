//
//  DBMaster.h
//  FMDBTest
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/fmdb.h>

@class HUUser;
@interface DBMaster : NSObject

+ (instancetype)sharedDBMaster;
- (void)openDataBaseWithDBName:(NSString *)dbName ;

- (BOOL)runSql:(NSString*)sql, ...;

- (FMResultSet *)query:(NSString*)sql;


//- (void)addUser:(HUUser *)user;
//- (NSArray *)getAllUsers;

@end
