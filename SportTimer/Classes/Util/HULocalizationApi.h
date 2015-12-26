//
//  HULocalizationApi.h
//  SportTimer
//
//  Created by mac on 15/12/26.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HULocalizationProtocol.h"

@interface HULocalizationApi : NSObject

+ (BOOL)saveObjec:(id<HULocalizationProtocol>)obj;

+ (id)querry:(id<HULocalizationProtocol>)obj;

@end
