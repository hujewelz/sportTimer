//
//  NSObject+HUCalculator.h
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUCalculatorMaker.h"

@class HUCalculatorMaker;
@interface NSObject (HUCalculator)

//+ (int)makeCalculators:(void(^)(HUCalculatorMaker *make))calculatorMaker;
- (NSString *)makeCalculators:(void(^)(HUCalculatorMaker *make))calculatorMaker;

@end
