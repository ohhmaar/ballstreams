//
//  GameDetailViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/23/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GameDetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface GameDetailViewController ()

@end

@implementation GameDetailViewController {
    NSMutableArray *liveGames;
    NSString *gameSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self grabStreamID];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)grabStreamID {
    
    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/Getondemandstream?id=%@&token=%@", self.streamID,scoreAPI];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        liveGames = jsonResults[@"iStreamSRC"];
        //gameSource = jsonResults[@"HDstreams"][0][@"src"];
        gameSource = jsonResults[@"hlsSRC"];
        NSLog(@"GameSource: %@", gameSource);
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
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:gameSource]];
    
        [moviePlayer.moviePlayer prepareToPlay];
        [moviePlayer.view setFrame:moviePlayer.moviePlayer.view.bounds];
        [moviePlayer.moviePlayer play];
    
        [self presentMoviePlayerViewControllerAnimated:moviePlayer];
}
@end
