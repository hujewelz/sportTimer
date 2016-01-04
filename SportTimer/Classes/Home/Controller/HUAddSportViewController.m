//
//  HUAddSportViewController.m
//  SportTimer
//
//  Created by mac on 15/12/24.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUAddSportViewController.h"
#import "UINavigationBar+BackgroundColor.h"
#import "HUEditSportViewController.h"
#import "HUUserViewModel.h"
#import "AppDelegate.h"


@interface HUAddSportViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HUAddSportViewController

- (instancetype)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        _userViewModel = viewModel;
    }
    return self;
}

- (void)dealloc {
    [_userViewModel cancel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewSport)];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ceeeeelll"];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.navigationController.navigationBar hu_setBackgroundColor:kDefaultColor];
    
    __weak typeof(self) weakself = self;
    [_userViewModel fetchDataSuccess:^(HUBasicViewModel *viewModel) {
        [weakself.tableView reloadData];
    
    } failure:^(NSString *msg) {
        //NSLog(@"error: %@", msg);
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.userViewModel.sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userViewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ceeeeelll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [self.userViewModel titleForCellAtSection:indexPath.section index:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        HUEditViewModel *viewModel = [self.userViewModel editStepViewModelAtSection:indexPath.section];
        HUEditSportViewController *editVc = [[HUEditSportViewController alloc] initWithViewModel:viewModel];
        [self.navigationController pushViewController:editVc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}

#pragma mark - private func


- (void)addNewSport {
    [self.userViewModel addNewItem];
    
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:self.userViewModel.sections-1];
    [self.tableView insertSections:set withRowAnimation:UITableViewRowAnimationBottom];
    
    NSIndexPath *indexP = [NSIndexPath indexPathForRow:0 inSection:self.userViewModel.sections-1];
    [self.tableView scrollToRowAtIndexPath:indexP atScrollPosition:UITableViewScrollPositionTop animated:YES];
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
