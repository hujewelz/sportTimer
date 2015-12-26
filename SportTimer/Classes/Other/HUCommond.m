//
//  HUCommond.m
//  SportTimer
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUCommond.h"
#import "NSObject+HUCalculator.h"
#import <objc/runtime.h>
//@interface HUCommond ()
//
//@end

@implementation HUCommond

- (id)initWithTarget:(id)target property:(id)property{
    if (!target) return nil;
    self = [super init];
    if (!self) return nil;
    
    _target = target;
    _property = property;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signal:) name:@"signal" object:nil];
    
    return self;
}

- (void)signal:(NSNotification *)notif {
    HUSignal *signalO = notif.object;
    
    NSLog(@"singal: %@, target: %@, property: %@", signalO.signal, _target, _property);
    
    [signalO setObject:self.target forKeyePath:self.property value:signalO.signal];
}

- (void)setObject:(HUSignal *)signal forKeyePath:(NSString *)keyPath {
    
}


@end



@implementation  NSObject (observer)

- (HUSignal *)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    
//    [observer makeCalculators:^(HUCalculatorMaker *make) {
//        make.add(@"!");
//    }];
   // NSLog(@"add observer");
    [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    //RACObserve(<#TARGET#>, <#KEYPATH#>)
    
    return [[HUSignal alloc] init];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"keypath: %@, value: %@", keyPath, change[NSKeyValueChangeNewKey]);
    
    //RAC(<#TARGET, ...#>)
    HUSignal *signalO = [self addObserver:self forKeyPath:keyPath];
    signalO.signal = change[NSKeyValueChangeNewKey];
    
//    HUCommond *commond = [[HUCommond alloc] init];
//    commond setObject:signalO forKeyePath:<#(NSString *)#>
    [[NSNotificationCenter defaultCenter] postNotificationName:@"signal" object:signalO];
}




@end

@implementation HUSignal

- (void)setObject:(id)obj forKeyePath:(NSString *)keyPath value:(id)value{
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signal:) name:@"signal" object:nil];
   // NSLog(@"%@.%@=%@", obj, keyPath,value);
    
    
    [obj setValue:value forKeyPath:keyPath];
}

@end



