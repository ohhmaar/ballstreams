//
//  BallstreamsModel.h
//  Ballstreams
//
//  Created by Omar Basrawi on 4/12/15.
//  Copyright (c) 2015 Omar Basrawi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BallstreamsModel : NSObject

+ (NSString *)getDate;

+ (void)GetLive:(NSString *)date api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler;

+ (void)GetLiveStream:(NSString *)streamID api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler;

+ (void)GetOnDemand:(NSString *)date api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler;

+ (void)GetOnDemandStream:(NSString *)streamID api:(NSString *)api completionHandler:(void (^)(NSDictionary *jsonResults))handler;

@end
