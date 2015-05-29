//
//  ProfileService.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 22/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "ProfileService.h"
#import "Profile.h"

@implementation ProfileService

+(NSUInteger) countProfiles
{
    RLMResults* results = [Profile allObjects];
    return [results count];
}

+(void) saveProfile:(Profile*)profile
{
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Profile createOrUpdateInRealm:realm withValue:profile];
    [realm commitWriteTransaction];
}

+(void) deleteProfile:(NSInteger)idProfile
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
  //  NSLog(@"%d",idProfile);
  //  NSLog(@"result:%@",[Profile objectsWhere:@"id == %d", idProfile].firstObject);
    Profile *profile = [Profile objectsWhere:@"id == %d", idProfile].firstObject;
    
    [realm deleteObject:profile];
    [realm commitWriteTransaction];

}

+(RLMResults*) displayProfile
{
   
    RLMResults *profile = [Profile allObjects];
    return profile;
}
@end
