//
//  MyView.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "MyView.h"

@interface MyView () {

    UIView *_mask;
    UIView *_topView;
}

@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setupView];
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((frame.size.width-60)/2, (frame.size.height-30)/2, 60, 30)];
//        [button setTitle:@"Click" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
    }
    return self;
}

- (void)setupView {
    NSArray *titles = @[@"OC", @"Swift", @"C++", @"Java"];
    CGFloat width = 50, height = 24;
    for (NSInteger i=0; i<titles.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(i*width, 0, width, height);
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titles[i];
        [self addSubview:label];
    }
    
    UIView *mask = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    //mask.backgroundColor = [UIColor redColor];
    mask.clipsToBounds = YES;
    [self addSubview:mask];
    _mask = mask;
    
    UIView *colorView = [[UIView alloc] initWithFrame:mask.frame];
    colorView.backgroundColor = [UIColor redColor];
    colorView.layer.cornerRadius = 10;
    [mask addSubview:colorView];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, height)];
    [mask addSubview:topView];
    _topView = topView;
    for (NSInteger i=0; i<titles.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(i*width, 0, width, height);
        label.textColor = [UIColor whiteColor];
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        [topView addSubview:label];
        label.tag = i+1;
        
    }
    
    
    
    for (NSInteger i=0; i<titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
       // button.backgroundColor = [UIColor blueColor];
        //button.alpha = 0.5;
        button.frame = CGRectMake(i*(width+2), 0, width, height);
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
}

- (void)buttonClick:(UIButton *)sender {
    //NSLog(@"sender tag: %zd", sender.tag);
    NSInteger idx = sender.tag;
//    [UIView animateWithDuration:3 animations:^{
//       
//    }];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:2 options:UIViewAnimationOptionCurveLinear animations:^{
        _mask.transform = CGAffineTransformMakeTranslation(idx*50, 0);
        _topView.transform = CGAffineTransformMakeTranslation(-idx*50, 0);
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
