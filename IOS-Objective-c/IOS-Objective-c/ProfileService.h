//
//  ProfileService.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 22/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Profile;
@interface ProfileService : NSObject

+(void) saveProfile:(Profile*)profile;
+(void) deleteProfile:(NSInteger*)idProfile;
+(RLMResults*) displayProfile;
@end
