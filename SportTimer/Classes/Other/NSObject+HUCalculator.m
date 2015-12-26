//
//  NSObject+HUCalculator.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "NSObject+HUCalculator.h"


@implementation NSObject (HUCalculator)

//+ (int)makeCalculators:(void (^)(HUCalculatorMaker *))calculatorMaker {
//    HUCalculatorMaker *maker = [[HUCalculatorMaker alloc] init];
//    calculatorMaker(maker);
//    return maker.result;
//}

- (NSString *)makeCalculators:(void (^)(HUCalculatorMaker *))calculatorMaker {
    HUCalculatorMaker *maker = [[HUCalculatorMaker alloc] init];
//    if (![self isKindOfClass:[NSNumber class]]) {
//        return 0;
//    }
//    NSNumber *num = (NSNumber *)self;
    maker.result = [[self calculatorResult:self] mutableCopy];
    calculatorMaker(maker);
    return maker.result;
}


- (NSString *)calculatorResult:(id)a {
    if (a && [a isKindOfClass:[NSNumber class]]) {
        NSNumber *str = (NSNumber *)a;
        return str.description;
    } else if ([a isKindOfClass:[NSString class]]){
        return a;
    } else {
        return [NSString stringWithFormat:@"%@",a];
    }
    return @"";
}

@end
