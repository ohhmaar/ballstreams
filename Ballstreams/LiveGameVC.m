//
//  LiveGameVC.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/26/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "LiveGameVC.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface LiveGameVC ()

@end

@implementation LiveGameVC {
    NSDictionary *liveGames;
    NSString *gameSource;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self grabStreamID];

    //[self addConstraints];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addConstraints {
    
    [self.view removeConstraints:self.view.constraints];
    
    
    UILabel *homeTeam = self.homeTeam;
    UILabel *awayTeam = self.awayTeam;
    UILabel *homeScore = self.homeScoreLabel;
    UILabel *awayScore = self.awayScoreLabel;
    UIButton *playGameButton = self.playGame;
    UIView *superView = self.view;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(homeTeam, awayTeam, homeScore, awayScore);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[homeTeam(<=140)]-30-[awayTeam(<=140)]-|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[homeTeam(<=40)]-20-[homeScore(<=60)]|" options:0 metrics:nil views:views]];
    
    constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[awayTeam(<=40)]-20-[awayScore]|" options:0 metrics:nil views:views]];
    
    
    [self.view addConstraints:constraints];
    
    
}

- (void)grabStreamID {
    
    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetLiveStream?id=%@&token=%@", self.streamID, scoreAPI];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        liveGames = jsonResults;
        //gameSource = jsonResults[@"HDstreams"][0][@"src"];
        gameSource = jsonResults[@"streams"][0][@"src"];

    }];
    [task resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playGame:(id)sender {
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];        MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:gameSource]];
    [moviePlayer.moviePlayer prepareToPlay];
    moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    [moviePlayer.view setFrame:moviePlayer.moviePlayer.view.bounds];
    [moviePlayer.moviePlayer play];
    
    [self presentMoviePlayerViewControllerAnimated:moviePlayer];
}
@end
