//
//  GetOnDemandTableViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/21/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GetOnDemandTableViewController.h"
#import "BallstreamsModel.h"
#import "GetOnDemandStreamViewController.h"
#import "GameInfoTableViewCell.h"
@interface GetOnDemandTableViewController ()

@end

@implementation GetOnDemandTableViewController
{
    NSArray *liveGames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.twoOnDemandDate;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [BallstreamsModel GetOnDemand:self.twoOnDemandDate api:@"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE" completionHandler:^(NSDictionary *jsonResults) {
        
        liveGames = jsonResults[@"ondemand"];
        
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
           });
    }];
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
    GameInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    

    cell.awayTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"awayTeam"]];
    cell.homeTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"homeTeam"]];
    cell.feedType.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"feedType"] ];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
        if ([segue.identifier isEqualToString:@"gameDetailSegue"]) {
            
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        GetOnDemandStreamViewController *detail = segue.destinationViewController;
        detail.streamID = liveGames[path.row][@"id"];
            detail.title = liveGames[path.row][@"id"];
            
        }
}

@end
