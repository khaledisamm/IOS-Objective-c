//
//  Profile.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Profile : RLMObject

@property NSInteger id;
@property NSString* firstName;
@property NSString* lastName;
@property NSString* sex;
@property NSString* birthDay;

- (NSDictionary *) toDictionary;

@end
