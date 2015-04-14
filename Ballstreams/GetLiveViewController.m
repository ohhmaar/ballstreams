//
//  GetLiveViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/26/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GetLiveViewController.h"
#import "BallstreamsModel.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface GetLiveViewController ()

@end

@implementation GetLiveViewController {
    NSDictionary *liveGames;
    NSString *gameSource;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)updateUI {
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
    
        self.awayScoreLabel.text = liveGames[@"awayScore"];
        self.homeScoreLabel.text = liveGames[@"homeScore"];
        self.awayTeam.text = liveGames[@"awayTeam"];
        self.homeTeam.text = liveGames[@"homeTeam"];
    });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    
    [BallstreamsModel GetLiveStream:self.streamID api:@"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=" completionHandler:^(NSDictionary *jsonResults) {
        
        liveGames = jsonResults;
        [self updateUI];
        gameSource = jsonResults[@"streams"][0][@"src"];
    }];
    
}



- (IBAction)playGame:(id)sender {
    
    if (gameSource) {
    
            AVAudioSession *session = [AVAudioSession sharedInstance];
            [session setCategory:AVAudioSessionCategoryPlayback error:nil];        MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:gameSource]];
            [moviePlayer.moviePlayer prepareToPlay];
            moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
            [moviePlayer.view setFrame:moviePlayer.moviePlayer.view.bounds];
            [moviePlayer.moviePlayer play];
            
            [self presentMoviePlayerViewControllerAnimated:moviePlayer];
        
    }
    else {
        NSLog(@"No LINK");
    }
}
@end
