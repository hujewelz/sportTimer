//
//  DBMaster.m
//  FMDBTest
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "DBMaster.h"

#import "HUUser.h"

@interface DBMaster ()

@property (nonatomic, strong) FMDatabase *dataBase;

@end

@implementation DBMaster

+ (instancetype)sharedDBMaster {
    static DBMaster *dbMaster = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbMaster = [[DBMaster alloc] init];
    });
    
    return dbMaster;
}

- (void)openDataBaseWithDBName:(NSString *)dbName {
    NSString *cachDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [cachDirectory stringByAppendingPathComponent:dbName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExit = [fileManager fileExistsAtPath:dbPath isDirectory:&isDir];
    
    if (!(isDirExit && isDir)) {
        if (![fileManager createDirectoryAtPath:dbPath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"文件夹创建失败！");
        }
        
    }
    
    NSString *filePath = [dbPath stringByAppendingPathComponent:@"dbdemo.db"];
    if (self.dataBase) {
        [self.dataBase close];
        self.dataBase = nil;
    }
    
    self.dataBase = [FMDatabase databaseWithPath:filePath];
    [self.dataBase open];
 
    [self createUserTable];
//    BOOL isFileExit = [fileManager fileExistsAtPath:filePath];
//    if (isFileExit) {
//        NSLog(@"文件已存在！");
//        return ;
//    }
//    if (![fileManager createFileAtPath:filePath contents:nil attributes:nil]) {
//         NSLog(@"文件创建失败！");
//    }
//    else {
//        NSLog(@"文件创建成功！");
//    }
}

- (void)createTable:(NSString *)tableName sql:(NSString *)sqlString {
    BOOL isExit = [self.dataBase tableExists:tableName];
    if (!isExit) {
        [self.dataBase executeUpdate:sqlString];
    }
}

- (BOOL)runSql:(NSString*)sql, ... {
    va_list args;
    NSMutableArray *array = [NSMutableArray array];
    va_start(args, sql);
    id obj;
    int idx = 0 ;
    int32_t count = [self count:sql];
   // NSLog(@"count: %d, idx: %d",count, idx);
    while (idx < count) {
        obj = va_arg(args, id);
        
        if ([obj isKindOfClass:[sql class]] && [obj isEqualToString:sql]) {
            
            break;
        }
        [array addObject:obj];
        //}
       // NSLog(@"idx: %d, obj: %@", idx, obj);
        idx ++;
        
    }
    //NSLog(@"arguments: %@, count: %d",array, count);
    
    NSAssert(array.count == count, @"参数个数不匹配");
    BOOL result ;//= [self.dataBase executeUpdate:sql];
    if (count == 0) {
        result = [self.dataBase executeUpdate:sql];
        //NSLog(@"无参数");
    }
    else if(count == array.count) {
        result = [self.dataBase executeUpdate:sql withArgumentsInArray:array];
        //NSLog(@"有参数");
    }
   //
    
    va_end(args);
    
    
    return result;
}


//- (BOOL)runSql:(NSString*)sql {
//    return [self.dataBase executeUpdate:sql];
//}

- (FMResultSet *)query:(NSString*)sql {
//    BOOL isExit = [self.dataBase tableExists:@"user"];
//    if (!isExit) {
//        return nil;
//    }


    return [self.dataBase executeQuery:sql];
}

- (int32_t)count:(NSString *)str {
    NSArray *count = [str componentsSeparatedByString:@"?"];
    return (int32_t)count.count-1;
}

- (void)createUserTable {
    [self createTable:@"user" sql:@"CREATE table user (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,userid INTEGER, name TEXT, gender INTEGER, age INTEGER)"];
}

//- (void)addUser:(HUUser *)user {
//    if (!user) {
//        return;
//    }
//    
//    HUUser *old = [self getUserWithUserid:user.userId];
//    if (old.userId.integerValue == user.userId.integerValue) {
//        [self updateUser:user];
//    } else {
//    [self.dataBase executeUpdate:@"INSERT INTO user(userid,name,gender,age) VALUES(?,?,?,?)",user.userId, user.name, @(user.gender), @(user.age)];
//
//    }
//}
//
//- (void)updateUser:(HUUser *)user {
//    if (!user) {
//        return;
//    }
//    
//    [self.dataBase executeUpdate:@"UPDATE user SET name=?,gender=?,age=? ", user.name, @(user.gender), @(user.age)];
//}
//
//- (HUUser *)getUserWithUserid:(NSNumber *)userid {
//    BOOL isExit = [self.dataBase tableExists:@"user"];
//    if (!isExit) {
//        return nil;
//    }
//    
//    FMResultSet *result = [self.dataBase executeQuery:@"SELECT userid,name, gender, age FROM user WHERE userid=?", userid];
//    HUUser *user = [[HUUser alloc] init];
//    if ([result next]) {
//        user.userId = @([result intForColumn:@"userid"]);
//        user.name = [result stringForColumn:@"name"];
//        user.gender = [result intForColumn:@"gender"];
//        user.age = [result intForColumn:@"age"];
//    }
//    [result close];
//    
//    return user;
//}
//
//
//- (NSArray *)getAllUsers {
//    BOOL isExit = [self.dataBase tableExists:@"user"];
//    if (!isExit) {
//        return nil;
//    }
//    
//    FMResultSet *result = [self.dataBase executeQuery:@"SELECT userid,name, gender, age FROM user"];
//    NSMutableArray *users = [NSMutableArray array];
//    while ([result next]) {
//        HUUser *user = [[HUUser alloc] init];
//        user.userId = @([result intForColumn:@"usrid"]);
//        user.name = [result stringForColumn:@"name"];
//        user.gender = [result intForColumn:@"gender"];
//        user.age = [result intForColumn:@"age"];
//        [users addObject:user];
//    }
//    [result close];
//    
//    return [users copy];
//}

@end
