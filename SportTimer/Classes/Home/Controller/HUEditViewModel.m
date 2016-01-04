//
//  HUEditViewModel.m
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUEditViewModel.h"
#import "HUUser.h"
#import "HULocalizationApi.h"

@interface HUEditViewModel ()

@property (nonatomic, strong) HUUser *model;

@end

@implementation HUEditViewModel
@dynamic model;

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    
    if (self) {
//        RACChannelTo(self, name) = RACChannelTo(self.model, name);
//        //NSString *age = [NSString stringWithFormat:@"%zd",self.model.age];
//        RACChannelTo(self, age) = RACChannelTo(self.model, name);
//        RACChannelTo(self, gender) = RACChannelTo(self.model, gender);
        _name = self.model.name;
        _age = [NSString stringWithFormat:@"%zd",self.model.age];
        _gender = self.model.gender;
    }
    return self;
}



- (void)save {
    HUUser *user = [[HUUser alloc] init];
    user.userId = self.model.userId;
    user.name = self.name;
    user.age = self.age.integerValue;
    user.gender = self.gender;
    NSLog(@"%@",user.description);
    [HULocalizationApi saveObjec:user];
}

@end
