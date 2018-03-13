//
//  NetworkService.h
//  FranciscoRedditObjC
//
//  Created by Admin on 3/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkService : NSObject

+ (void)getImage:(NSInteger)number success:(void(^)(UIImage *image))success failure:(void(^)(NSError *error))failure;

@end
