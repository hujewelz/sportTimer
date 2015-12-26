//
//  HULocalizationApi.m
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "HULocalizationApi.h"

@implementation HULocalizationApi

+ (BOOL)saveObjec:(id<HULocalizationProtocol>)obj {
    
    if ([obj respondsToSelector:@selector(save)]) {
        return [obj save];
    }
    
    return NO;
}

+ (id)querry:(id<HULocalizationProtocol>)obj {
    if ([obj respondsToSelector:@selector(querry)]) {
        return [obj querry];
    }
    
    return nil;
}

@end
