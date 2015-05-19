//
//  RemoteService.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "RemoteService.h"
#import "AFHTTPRequestOperationManager.h"
#import "DisplayProfileTableViewController.h"


@implementation RemoteService

-(void) submitProfile:(Profile*)profile callback:(void (^)(id data))completionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"http://192.168.1.2/ios/public/profiles" parameters:[profile toDictionary]
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         completionBlock(responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}

-(void)displayProfile:(void (^)(id data))completionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"http://192.168.1.2/ios/public/profiles"
      parameters:nil
     
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
            completionBlock(responseObject);

         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data    "
                                                                 message:[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }
     ];
}
@end