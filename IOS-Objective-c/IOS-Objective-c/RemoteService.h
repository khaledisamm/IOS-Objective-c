//
//  RemoteService.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface RemoteService : NSObject

//+(RemoteService*) sharedRemoteService;
-(void) submitProfile:(Profile*)profile callback:(void (^)(id data))completionBlock;
-(void)displayProfile:(void (^)(id data))completionBlock;
-(void) deleteProfile:(Profile*)profile completion:(void (^)(Profile* profileResp))completionBlock;
-(void) updateProfile:(Profile*)profile completion:(void (^)(Profile* profileResp))completionBlock;

@end
