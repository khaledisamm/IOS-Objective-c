//
//  Profile.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 13/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "Profile.h"

@implementation Profile



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
        @"firstName" :self.firstnameInput,
        @"lastName" :self.lastnameInput,
        @"birthDay" :self.DateInput,
        @"sex" :self.sexInput
    };
}

@end
