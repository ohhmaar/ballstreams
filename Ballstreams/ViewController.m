//
//  ViewController.m
//  Ballstreams
//
//  Created by Omar Basrawi on 11/20/14.
//  Copyright (c) 2014 Omar Basrawi. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



//- (void)fetchGames
//{
//    NSString *scoreAPI = @"Wkp6S0d3b0xMQTU2MzVNR0xjVTNOeUxzQzRSZ1VSQm5Ga3Z4MldOV0lXVUJoS09tb1VQdzlXTkt2QlhEMlJkeloxV3Uvb051OGlRUmUzOFU3c0MwWEJEK21CM1I1N3ZOaGVEa2FBRXd4UGU5eDM1UTM0WE1pN3B5cEZKcW5ZaFE=";
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/getondemandstream?id=13202&token=%@", scoreAPI];
//    NSURL *url = [[NSURL alloc] initWithString:urlString];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    request.HTTPMethod = @"GET";
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSLog(@"Hello");
//        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//        NSLog(@"%@", jsonResults);
//    }];
//    [task resume];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
