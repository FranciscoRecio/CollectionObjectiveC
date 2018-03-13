//
//  NetworkService.m
//  FranciscoRedditObjC
//
//  Created by Admin on 3/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService ()

@end

@implementation NetworkService

+(void)getImage:(NSInteger)number success:(void (^)(UIImage *))success failure:(void (^)(NSError *))failure {
    NSString* urlStr = [NSString stringWithFormat:@"https://unsplash.it/320/100?image=%ld", number];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error)
            failure(error);
        else {
            UIImage *image = [UIImage imageWithData:data];
            success(image);
        }
    }];
    [dataTask resume];
}

@end
