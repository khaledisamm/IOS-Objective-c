//
//  RemoteService.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "RemoteService.h"
#import "AFHTTPRequestOperationManager.h"


@implementation RemoteService
{
    AFHTTPRequestOperationManager* _operationManager;
}

//+(RemoteService*) sharedRemoteService
//{
//    // structure used to test whether the block has completed or not
//    static dispatch_once_t p = 0;
//    
//    // initialize sharedObject as nil (first call only)
//    __strong static id _sharedObject = nil;
//    
//    // executes a block object once and only once for the lifetime of an application
//    dispatch_once(&p, ^
//    {
//        NSString* webServerURL = [NSString stringWithFormat:@"http://%@:9000",@"192.168.1.2"];
//        _sharedObject = [[RemoteService alloc] initWithBaseURL:[NSURL URLWithString:webServerURL]];
//    });
//    // returns the same object each time
//    return _sharedObject;
//}

-(void) submitProfile:(Profile*)profile
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"http://192.168.1.2/ios/public/profiles" parameters:[profile toDictionary]
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
//         DLog(@"%@",responseObject[@"id"]);
//         profile.id = [responseObject[@"id"] intValue];
//         DLog(@"%ld",(long)profile.id);
//         [ProfileService saveProfile:profile];
//         completionBlock(profile);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
//         completionBlock(nil);
     }];
}

@end
