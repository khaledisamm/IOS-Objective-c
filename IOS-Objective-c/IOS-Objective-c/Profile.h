//
//  Profile.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property NSInteger id;
@property NSString* firstnameInput;
@property NSString* lastnameInput;
@property NSString* sexInput;
@property NSString* DateInput;

- (NSDictionary *) toDictionary;

@end
