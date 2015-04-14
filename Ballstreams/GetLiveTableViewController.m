//
//  GetLiveTableViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/26/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GetLiveTableViewController.h"
#import "GetLiveViewController.h"
#import "BallstreamsModel.h"
#import "GameInfoTableViewCell.h"

@interface GetLiveTableViewController ()

@end

@implementation GetLiveTableViewController {
    NSArray *liveGames;
    NSString *formattedDate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"Tip-off";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Avenir-Heavy" size:21];
    label.text = self.navigationItem.title;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = label;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
    NSDate *date = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    formattedDate = [dateFormatter stringFromDate:date];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [BallstreamsModel GetLive:[NSString stringWithFormat:@"%@", formattedDate]  api:@"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=" completionHandler:^(NSDictionary *jsonResults) {
        
        liveGames = jsonResults[@"schedule"];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
        if ([liveGames[0][@"isPlaying"] isEqualToNumber:@1]) {
            NSLog(@"hello");
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return liveGames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GameInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
     
    
    cell.awayTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"awayTeam"]];
    cell.homeTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"homeTeam"]];
    cell.gameTimeLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"startTime"]];
    cell.feedType.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"feedType"]];
    
    if ([liveGames[indexPath.row][@"isPlaying"] isEqualToNumber:@0]) {
        
            cell.awayTeamLabel.textColor = [UIColor colorWithRed:175/255.0 green:194/255.0 blue:213/255.0 alpha:1];
            cell.homeTeamLabel.textColor = [UIColor colorWithRed:175/255.0 green:194/255.0 blue:213/255.0 alpha:1];
            cell.gameTimeLabel.textColor = [UIColor colorWithRed:175/255.0 green:194/255.0 blue:213/255.0 alpha:1];
            cell.feedType.textColor = [UIColor colorWithRed:175/255.0 green:194/255.0 blue:213/255.0 alpha:1];
    } else {
        cell.awayTeamLabel.textColor = [UIColor blackColor];
        cell.homeTeamLabel.textColor = [UIColor blackColor];
        cell.gameTimeLabel.textColor = [UIColor blackColor];
        cell.feedType.textColor = [UIColor blackColor];

    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"liveGameDetail"]) {
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        GetLiveViewController *vc = segue.destinationViewController;
        vc.streamID = liveGames[path.row][@"id"];
        vc.title = liveGames[path.row][@"id"];
    }
}
@end
