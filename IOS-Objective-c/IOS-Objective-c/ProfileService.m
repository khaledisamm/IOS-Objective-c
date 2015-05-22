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

+(void) saveProfile:(Profile*)profile
{
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Profile createOrUpdateInRealm:realm withObject:profile];
    [realm commitWriteTransaction];
}

+(void) deleteProfile:(NSInteger*)idProfile
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    RLMResults *profile = [Profile objectsWhere:@"id = %@", idProfile];
    [realm deleteObject:profile];
    [realm commitWriteTransaction];

}

+(RLMResults*) displayProfile
{
   
    RLMResults *profile = [Profile allObjects];
    return profile;
}
@end
