//
//  Profile.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "Profile.h"

@implementation Profile

//@synthesize firstnameInput, lastnameInput, DateInput, sexInput;

+(NSString*) primaryKey
{
    return @"id";
}

+(NSDictionary*) defaultPropertyValues
{
    return
    @{
      @"firstName" : @"",@"lastName" : @"",@"birthDay" : @"",@"sex" : @""
      };
}

- (NSDictionary *) toDictionary
{
    return @ {
        @"firstName"    :self.firstName,
        @"lastName"     :self.lastName,
        @"birthDay"     :self.birthDay,
        @"sex"          :self.sex,
    };
}

@end
