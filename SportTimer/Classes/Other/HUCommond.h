//
//  HUCommond.h
//  SportTimer
//
//  Created by mac on 15/12/25.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HUObserve(TARGER, KEYPATH) [(TARGER) addObserver:self forKeyPath:(KEYPATH)]

#define HUCommond(TARGET,PROPERTY) [[HUCommond alloc] initWithTarget:(TARGET) property:(PROPERTY)]

@interface HUSignal : NSObject

@property (nonatomic, strong) id signal;

- (void)setObject:(id)obj forKeyePath:(NSString *)keyPath value:(id)value;

@end


@interface HUCommond : NSObject

@property (nonatomic, strong) id target;
@property (nonatomic, strong) id property;

@property (nonatomic, strong) id signal;

- (id)initWithTarget:(id)target property:(id)property;
- (void)setObject:(HUSignal *)signal forKeyePath:(NSString *)keyPath;

@end


@interface NSObject (observer)

- (HUSignal *)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end


