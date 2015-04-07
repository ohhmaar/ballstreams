//
//  DatePickerViewController.h
//  Ballstreams
//
//  Created by Omar Basrawi on 3/25/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController

@property (nonatomic) NSString *onDemandDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *viewGames;

@end
