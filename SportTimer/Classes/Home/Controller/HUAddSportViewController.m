//
//  HUAddSportViewController.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUAddSportViewController.h"
#import "UINavigationBar+BackgroundColor.h"
#import "HUUserViewModel.h"

@interface HUAddSportViewController ()
@property (nonatomic,strong) HUUserViewModel *userViewModel;

@end

@implementation HUAddSportViewController

- (void)dealloc {
    NSLog(@"%s", sel_getName(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    HUUser *user = [[HUUser alloc] init];
    user.userId = @301;
    _userViewModel= [[HUUserViewModel alloc] initWithModel:user];
    //_userViewModel.networkingReachable = NO;
    
    __weak typeof(self) weakself = self;
    [_userViewModel fetchDataSuccess:^(HUViewModel *viewModel) {
        [weakself reloadData];
        //self.name = viewModel.name;
    } failure:^(NSString *msg) {
        NSLog(@"error: %@", msg);
    }];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar hu_setBackgroundColor:kDefaultColor];
    //[self.navigationController setNavigationBarHidden:NO animated:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData {
    self.title = _userViewModel.name;
}

- (void)buttonClicked {
     // NSLog(@"name: %@", _name);
    [_userViewModel cancel];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
