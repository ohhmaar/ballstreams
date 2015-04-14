//
//  BallstreamsModel.m
//  Ballstreams
//
//  Created by Omar Basrawi on 4/12/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

#import "BallstreamsModel.h"

@implementation BallstreamsModel

+ (NSString *)getDate {
    
    NSDate *date = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    return formattedDate;
}

+ (void)GetLive:(NSString *)date api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler {

    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetLive?date=%@&token=%@", date, api];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        handler(jsonResults);

    }];
    
    [task resume];
}


+ (void)GetLiveStream:(NSString *)streamID api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetLiveStream?id=%@&token=%@", streamID, api];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       
        handler(jsonResults);
        
    }];
    [task resume];
}


+ (void)GetOnDemand:(NSString *)date api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetOnDemand?date=%@&token=%@", date, api];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        handler(jsonResults);
        
    }];
    [task resume];
    
    
    
}

+ (void)GetOnDemandStream:(NSString *)streamID api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.ballstreams.com/GetOnDemandStream?id=%@&token=%@", streamID, api];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        handler(jsonResults);
        
    }];
    [task resume];
    
}

@end
