//
//  DatePickerViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 3/25/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

#import "DatePickerViewController.h"
#import "BasketballGamesTVC.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view.
    [self addConstraints];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)addConstraints
{
    //self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    
    UIButton *viewGames = self.viewGames;
    UIDatePicker *datePicker = self.myDatePicker;
    UIView *superView = self.view;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(viewGames, datePicker, superView);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[datePicker]-|" options:0 metrics:nil views:views];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[datePicker]-20-[viewGames(==superView@400)]-|" options:0 metrics:nil views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[viewGames(==superView@400)]-|" options:0 metrics:nil views:views]];

    
    [self.view addConstraints:constraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    
        self.onDemandDate = strDate;
        //self.title = strDate;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"demandSegue"]) {
        BasketballGamesTVC *onDemandTVC = [segue destinationViewController];
        [onDemandTVC setTwoOnDemandDate:self.onDemandDate];
    }
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
