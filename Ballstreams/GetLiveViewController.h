//
//  GetLiveViewController.h
//  Ballstreams
//
//  Created by Omar Basrawi on 11/26/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetLiveViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *homeScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *awayScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeam;
@property (weak, nonatomic) IBOutlet UILabel *awayTeam;

- (IBAction)playGame:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *playGame;
@property (nonatomic, strong) NSString *streamID;

@end
