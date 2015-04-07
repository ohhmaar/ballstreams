//
//  BasketballGamesTVC.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/21/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "BasketballGamesTVC.h"
#import "GameDetailViewController.h"
#import "GameInfoTableViewCell.h"
@interface BasketballGamesTVC ()

@end

@implementation BasketballGamesTVC
{
    NSArray *liveGames;
    NSDate *date;
    NSDate *sevenDaysAgo;
    NSString *previousDay;
    NSString *outputDate;
    NSDateFormatter *dateFormatter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self fetchGames];
    
    date = [NSDate date];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    //dateFormatter.timeStyle = NSDateFormatterNoStyle;
    outputDate = [dateFormatter stringFromDate:date];
    self.title = self.twoOnDemandDate;
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:-1];
    sevenDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    previousDay = [dateFormatter stringFromDate:sevenDaysAgo];
    //NSLog(@"\ncurrentDate: %@\nseven days ago: %@", date, previousDay);
    
    NSLog(@"Previous Day: %@", outputDate);
    [self dailyGames];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)fetchGames
//{
//    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/getlive?date=11/23/2014&token=%@", scoreAPI];
//    NSURL *url = [[NSURL alloc] initWithString:urlString];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    request.HTTPMethod = @"GET";
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"Hello");
//        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//        liveGames = jsonResults[@"schedule"];
//        [self.tableView reloadData];
//        
//        NSLog(@"%@", [liveGames valueForKeyPath:@"awayTeam"]);
//    }];
//    [task resume];
//}

- (void)dailyGames
{
    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/Getondemand?date=%@&token=%@", self.twoOnDemandDate, scoreAPI];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        liveGames = jsonResults[@"ondemand"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

        //NSLog(@"%@", liveGames);
    }];
    [task resume];
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
    GameDetailViewController *detail = segue.destinationViewController;
    detail.streamID = liveGames[path.row][@"id"];
        detail.title = liveGames[path.row][@"id"];
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
