//
//  GameInfoTableViewCell.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/27/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GameInfoTableViewCell.h"
#import "GetLiveTableViewController.h"

@implementation GameInfoTableViewCell

- (void)awakeFromNib {
    [self addConstraints];
    // Initialization code
}

- (void)addConstraints {
    
    [self.contentView removeConstraints:self.contentView.constraints];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    UILabel *awayTeam = self.awayTeamLabel;
    UILabel *homeTeam = self.homeTeamLabel;
    UILabel *feedType = self.feedType;
    UILabel *gameTime = self.gameTimeLabel;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(awayTeam, homeTeam,feedType,gameTime);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[awayTeam(160)]-15-[gameTime]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[homeTeam(160)]-15-[feedType]|"
                                                           options:0
                                                           metrics:nil
                                                             views:views]];

    
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[awayTeam]-[homeTeam]-|"
                                                           options:0
                                                           metrics:nil
                                                             views:views]];
    constraints = [constraints arrayByAddingObjectsFromArray:
                   [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[feedType]-[gameTime]|"
                                                           options:0
                                                           metrics:nil
                                                             views:views]];
    
    [self.contentView addConstraints:constraints];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
