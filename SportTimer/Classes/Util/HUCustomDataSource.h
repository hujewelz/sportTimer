//
//  HUCustomDataSource.h
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ConfigureCell)(id, id);

@interface HUCustomDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

-(id)initWithItems:(NSArray *)items cellIdentifer:(NSString *)identifer configureCellBlock:(ConfigureCell)block;

@end
