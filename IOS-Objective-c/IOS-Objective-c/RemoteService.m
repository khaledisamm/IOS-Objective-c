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
#import "ProfileService.h"


@implementation RemoteService

-(void) submitProfile:(Profile*)profile callback:(void (^)(id data))completionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager POST:@"http://192.168.1.2/ios/public/profiles" parameters:[profile toDictionary]
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         profile.id = [responseObject[@"id"] intValue];
         [ProfileService saveProfile:profile];
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
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                                 message:[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }
     ];
}

-(void) deleteProfile:(NSInteger)profileId completion:(void (^)(id data))completionBlock
{   
    //TODO : submit to server
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *url=[NSString stringWithFormat:@"http://192.168.1.2/ios/public/profiles/%ld", (long)profileId];
    [manager DELETE:url parameters:NULL
            success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         [ProfileService deleteProfile:profileId];
         completionBlock(responseObject);
     }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}

-(void) updateProfile:(Profile*)profile callback:(void (^)(id data))completionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *url=[NSString stringWithFormat:@"http://192.168.1.2/ios/public/profiles/%ld", (long)profile.id];
    [manager PUT:url parameters:[profile toDictionary]
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         [ProfileService saveProfile:profile];
         completionBlock(responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}
@end