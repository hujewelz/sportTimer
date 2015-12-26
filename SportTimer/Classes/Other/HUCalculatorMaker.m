//
//  HUCalculatorMaker.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUCalculatorMaker.h"

@implementation HUCalculatorMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        _result = [NSMutableString string];
    }
    return self;
}

- (HUCalculatorMaker *(^)(id a))add {
    return ^(id a) {
        
        return [self calculatorResult:a];
    };
}

- (HUCalculatorMaker *)calculatorResult:(id)a {
    // NSLog(@"result: %@", _result);
    if (a && [a isKindOfClass:[NSNumber class]]) {
        NSNumber *str = (NSNumber *)a;
        //NSLog(@"number: %@", str.description);
        [_result appendString: str.description];
    } else if ([a isKindOfClass:[NSString class]]){
        // NSLog(@"string: %@", a);
        [_result appendString: a];
    } else {
        

        [_result appendString:[NSString stringWithFormat:@"%@",a]];
    }
    //NSLog(@"result: %@", _result);
    return self;
}

@end
