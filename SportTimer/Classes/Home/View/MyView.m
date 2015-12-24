//
//  MyView.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width-60)/2, (frame.size.height-30)/2, 60, 30)];
        [button setTitle:@"Click" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

- (void)buttonClick {
    NSLog(@"button clicked");
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:@"1223232"];
    }
}

@end
