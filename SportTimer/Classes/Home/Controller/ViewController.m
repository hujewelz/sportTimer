//
//  ViewController.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright © 2015年 jinhuadiqigan. All rights reserved.
//

#import "ViewController.h"
#import "HUParallaxView.h"
#import "UINavigationBar+BackgroundColor.h"



@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    MyView *myview = [[MyView alloc] initWithFrame:CGRectMake(60, 200, 200, 200)];
//    [self.view addSubview:myview];
//    
//    myview.delegateSignal = [RACSubject subject];
//    [myview.delegateSignal subscribeNext:^(id x) {
//        NSLog(@"点击了通知按钮: %@", x);
//    }];
    HUParallaxView *parallaxView = [[HUParallaxView alloc] initWithFrame:self.view.bounds];
    parallaxView.didScrollSignal = [RACSubject subject];
    [self.view addSubview:parallaxView];
    
    [parallaxView.didScrollSignal subscribeNext:^(NSNumber *offsetY) {
        //NSLog(@"%f", offsetY.floatValue);
        CGFloat alpha = 1 - ((64-offsetY.floatValue)/64);
        [self.navigationController.navigationBar hu_setBackgroundColor:[[UIColor orangeColor] colorWithAlphaComponent:alpha]];
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.navigationController.navigationBar hu_setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView delegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat offsetY = scrollView.contentOffset.y;
//    
//    CGFloat alpha = 1 - ((64-offsetY)/64);
//    
//    [self.navigationController.navigationBar hu_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
//    
//    if (offsetY < 0) {
//        //_bgTopConstraint.equalTo(self.view);
//        _bgHeightConstraint.equalTo(@(KBGHeight-offsetY));
//        
//        CGFloat width = (KBGHeight-offsetY)*self.tableView.frame.size.width / KBGHeight;
//        _bgWidthConstraint.equalTo(@(width));
//    } else {
//        _bgTopConstraint.equalTo(@(-offsetY));
//    }
//}
//
//#pragma mark - getter
//
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//        _tableView.delegate = self;
//        _tableView.tableHeaderView = [self tableHeaderView];
//    }
//    return _tableView;
//}
//
//#pragma mark - private func 
//
//- (void)setupView {
//    UIImageView *bgView = [UIImageView new];
//    bgView.image = [UIImage imageNamed:@"a.jpg"];
//    [self.view insertSubview:bgView aboveSubview:self.tableView];
//    bgView.contentMode = UIViewContentModeScaleAspectFill;
//    bgView.clipsToBounds = YES;
//    
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        self.bgTopConstraint = make.top.equalTo(self.view);
//        make.centerX.equalTo(self.view.mas_centerX);
//        self.bgHeightConstraint = make.height.equalTo(@(KBGHeight));
//        self.bgWidthConstraint = make.width.equalTo(self.view.mas_width);
//        
//    }];
//}
//
//- (UIView *)tableHeaderView {
//    UIView *headerView = [[UIView alloc] init];
//    headerView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, KBGHeight);
//    headerView.backgroundColor = [UIColor clearColor];
//    return headerView;
//}
//
//- (RACSignal *)signal {
//   return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//    
//        if ([self.textField.text isEqualToString:@"123"]) {
//            
//            [subscriber sendNext:@1];
//            [subscriber sendCompleted];
//        }
//       return nil;
//    }];
//    
//}

@end
