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
#import "HUAddSportViewController.h"
#import "NSObject+HUCalculator.h"
#import "HUUserViewModel.h"
#import "HUUserViewModel.h"
#import "HUModel.h"
#import "HUCommond.h"
#import "MyView.h"
#import <MJRefresh/MJRefresh.h>

@interface ViewController ()<HUParallaxViewDelegate, HUParallaxViewDataSoruce>

@property (nonatomic, strong) HUModel *model;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewSport)];
    
    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(0, 100, 200, 25)];
    [self.view addSubview:view];
    
//    HUParallaxView *parallaxView = [[HUParallaxView alloc] initWithFrame:self.view.bounds];
//    parallaxView.didScrollSignal = [RACSubject subject];
//    parallaxView.delegate = self;
//    parallaxView.dataSource = self;
//    [self.view addSubview:parallaxView];
//        
//    [parallaxView.didScrollSignal subscribeNext:^(NSNumber *offsetY) {
//        //NSLog(@"%f", offsetY.floatValue);
////        CGFloat alpha = 1 - ((64-offsetY.floatValue)/64);
////        [self.navigationController.navigationBar hu_setBackgroundColor:[[UIColor orangeColor] colorWithAlphaComponent:alpha]];
//    }];
      // NSLog(@"result: %@", result);
//    
//    _model = [[HUModel alloc] init];
//    
//    //[self.model addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    
//    //RAC(self, title) = RACObserve(self.model, name);
//    HUCommond *com = HUCommond(self, @"title") ;
//    HUObserve(self.model, @"name");
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        _model.name = result;
//        NSLog(@"commod: %@", com);
//    });
//
   
      
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.navigationController.navigationBar hu_setBackgroundColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    id value = change[NSKeyValueChangeNewKey];
//    self.title = value;
//}

#pragma mark - HUParallaxViewDataSoruce

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

#pragma mark - HUParallaxViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self addNewSport];
}

#pragma mark - private func

- (void)addNewSport {
    HUUser *user = [[HUUser alloc] init];
    user.userId = @301;
    HUUserViewModel *userViewModel= [[HUUserViewModel alloc] initWithModel:user];

    HUAddSportViewController *newSportVC = [[HUAddSportViewController alloc] initWithViewModel:userViewModel];
    [self.navigationController pushViewController:newSportVC animated:YES];
}


@end
