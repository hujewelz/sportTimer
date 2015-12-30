//
//  HUTabBar.m
//  SportTimer
//
//  Created by mac on 15/12/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUTabBar.h"

@interface HUTabBar () {
    NSMutableArray *_buttons;
    UIButton *_selectedBtn;
}

@property (nonatomic, copy) void (^completion)(NSInteger selectedIndx);

@end

@implementation HUTabBar
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _buttons = [NSMutableArray arrayWithCapacity:3];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    NSArray *images= @[@"tabBar_home",@"tabBar_area",@"tabBar_profile"];
    for (NSInteger i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_bg_normal"] forState:UIControlStateNormal];
        NSString *normal = [NSString stringWithFormat:@"%@_normal",images[i]];
        NSString *selected = [NSString stringWithFormat:@"%@_selected",images[i]];
        [button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
        button.adjustsImageWhenHighlighted = NO;
        button.selected = NO;
        [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        
        [self addSubview:button];
        [_buttons addObject:button];
        
        if (i == 0) {
            button.selected = YES;
            _selectedBtn = button;
            [button setBackgroundImage:[UIImage imageNamed:@"tabBar_bg_selected"] forState:UIControlStateNormal];
        }
        
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.width / 3;
    
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")] || [view isKindOfClass:NSClassFromString(@"UIImageView")]) {
            [view removeFromSuperview];
        }
    }
    
    [_buttons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL *stop) {
        obj.size = CGSizeMake(width, self.height);
        obj.x = idx * width;
    }];
    
}

- (void)didSelecteItemCompletion:(void (^)(NSInteger))completion {
    _completion = [completion copy];
}

- (void)clickBtn:(UIButton *)button {
    //1.先将之前选中的按钮设置为未选中
    _selectedBtn.selected = NO;
    [_selectedBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_bg_normal"] forState:UIControlStateNormal];
    //2.再将当前按钮设置为选中
    button.selected = YES;
    [button setBackgroundImage:[UIImage imageNamed:@"tabBar_bg_selected"] forState:UIControlStateNormal];
    //3.最后把当前按钮赋值为之前选中的按钮
    _selectedBtn = button;
    
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    //self.selectedItem = button.tag;
    _completion(button.tag);
}



@end
