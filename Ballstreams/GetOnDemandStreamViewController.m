//
//  GetOnDemandStreamViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/23/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "GetOnDemandStreamViewController.h"
#import "BallstreamsModel.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface GetOnDemandStreamViewController ()

@end

@implementation GetOnDemandStreamViewController {
    NSString *gameSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
        [BallstreamsModel GetOnDemandStream:self.streamID api:@"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=" completionHandler:^(NSDictionary *jsonResults) {
            
                gameSource = jsonResults[@"hlsSRC"];
        }];
}

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
