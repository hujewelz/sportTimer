//
//  HUEditSportViewController.m
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUEditSportViewController.h"
#import "HUEditViewModel.h"

@interface HUEditSportViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;

@end

@implementation HUEditSportViewController
- (instancetype)initWithViewModel:(HUEditViewModel *)viewModel {
    self = [super init];
    if (self) {
        _editViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(add)];
    // Do any additional setup after loading the view from its nib.
    self.nameField.text = self.editViewModel.name;
    self.ageField.text = self.editViewModel.age;
    self.genderSegment.selectedSegmentIndex = self.editViewModel.gender;
    
    RAC(self.editViewModel, name) = [self.nameField rac_textSignal];
    RAC(self.editViewModel, age) = [self.ageField rac_textSignal];
    RAC(self.editViewModel, gender) = [[self.genderSegment rac_signalForControlEvents:UIControlEventValueChanged] map:^id(UISegmentedControl *value) {
        return @(value.selectedSegmentIndex);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setAgeAction:(UISegmentedControl *)sender {
    
}

- (void)add {
    [self.editViewModel save];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
