//
//  HUUser.h
//  FMDBTest
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HULocalizationProtocol.h"

@interface HUUser : NSObject <HULocalizationProtocol>

@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger age;


@end
