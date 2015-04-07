//
//  LiveStreamBasketballGamesTVC.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/26/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "LiveStreamBasketballGamesTVC.h"
#import "LiveGameVC.h"
#import "GameInfoTableViewCell.h"

@interface LiveStreamBasketballGamesTVC ()

@end

@implementation LiveStreamBasketballGamesTVC {
    NSArray *liveGames;
    NSString *test;
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
    
    [self getLiveGames];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getLiveGames
{
    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetLive?&token=%@", scoreAPI];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        liveGames = jsonResults[@"schedule"];
        //test = jsonResults[@"schedule"][0][@"sdUrl"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
        //NSLog(@"%@", liveGames);
        //NSLog(@"%@", test);
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
    
    GameInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
     
    
    cell.awayTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"awayTeam"]];
    cell.homeTeamLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"homeTeam"]];
    cell.gameTimeLabel.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"startTime"]];
    cell.feedType.text = [NSString stringWithFormat:@"%@", liveGames[indexPath.row][@"feedType"]];
    
    
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    LiveGameVC *vc = [[LiveGameVC alloc] init];
//    vc.streamID = liveGames[indexPath.row][@"id"];
//    vc.title = liveGames[indexPath.row][@"id"];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"liveGameDetail"]) {
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        LiveGameVC *vc = segue.destinationViewController;
        vc.streamID = liveGames[path.row][@"id"];
        vc.title = liveGames[path.row][@"id"];
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
