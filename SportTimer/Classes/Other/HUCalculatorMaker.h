//
//  HUCalculatorMaker.h
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUCalculatorMaker : NSObject

@property (nonatomic, strong) NSMutableString *result;

- (HUCalculatorMaker *(^)(id))add;

@end
