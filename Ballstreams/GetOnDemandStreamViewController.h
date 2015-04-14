//
//  GetOnDemandStreamViewController.h
//  Ballstreams
//
//  Created by Omar Basrawi on 11/23/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetOnDemandStreamViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *homeTeam;
@property (weak, nonatomic) IBOutlet UILabel *awayTeam;
- (IBAction)playGame:(id)sender;
@property (nonatomic, strong) NSString *streamID;


@end
