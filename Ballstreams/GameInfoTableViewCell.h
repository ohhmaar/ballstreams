//
//  GameInfoTableViewCell.h
//  Ballstreams
//
//  Created by Omar Basrawi on 11/27/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *awayTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedType;


@end
