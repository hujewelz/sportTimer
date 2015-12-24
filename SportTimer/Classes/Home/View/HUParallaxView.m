//
//  HUParallaxView.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUParallaxView.h"
#import <Masonry/Masonry.h>

static const CGFloat KBGHeight = 200;
static const CGFloat KUserIconWH = 80;

@interface HUParallaxView ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MASConstraint *bgWidthConstraint;
@property (nonatomic, strong) MASConstraint *bgHeightConstraint;
@property (nonatomic, strong) MASConstraint *bgTopConstraint;



@end

@implementation HUParallaxView

- (void)dealloc {
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tableView];
        [self setupView];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[UITableView class]] && [keyPath isEqualToString:@"contentOffset"]) {
    
        CGFloat offsetY = ((NSValue *)change[NSKeyValueChangeNewKey]).CGPointValue.y;
        
        if (offsetY < 0) {
            //_bgTopConstraint.equalTo(self.view);
            _bgHeightConstraint.equalTo(@(KBGHeight-offsetY));
            
            CGFloat width = (KBGHeight-offsetY)*self.tableView.frame.size.width / KBGHeight;
            _bgWidthConstraint.equalTo(@(width));
        } else {
            _bgTopConstraint.equalTo(@(-offsetY));
        }

        [self.didScrollSignal sendNext:@(offsetY)];
    
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        //_tableView.delegate = self;
        _tableView.tableHeaderView = [self tableHeaderView];
        
        [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _tableView;
}

#pragma mark - private func

- (void)setupView {
    UIImageView *bgView = [UIImageView new];
    //bgView.image = [UIImage imageNamed:@"b.jpg"];
    [self insertSubview:bgView aboveSubview:self.tableView];
//    bgView.contentMode = UIViewContentModeScaleAspectFill;
//    bgView.clipsToBounds = YES;
    bgView.backgroundColor = [UIColor orangeColor];
    
    UIImageView *userIcon = [UIImageView new];
    userIcon.layer.cornerRadius = KUserIconWH/2;
    //userIcon.layer.masksToBounds = YES;
    userIcon.contentMode = UIViewContentModeScaleAspectFill;
    userIcon.image = [UIImage imageNamed:@"a.jpg"];
    userIcon.layer.borderWidth = 1;
    userIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    userIcon.clipsToBounds = YES;
    [bgView addSubview:userIcon];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.bgTopConstraint = make.top.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
        self.bgHeightConstraint = make.height.equalTo(@(KBGHeight));
        self.bgWidthConstraint = make.width.equalTo(self.mas_width);
        
    }];
    
    [userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgView);
        make.width.and.height.equalTo(@(KUserIconWH));
    }];
}

- (UIView *)tableHeaderView {
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, KBGHeight);
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}


@end
