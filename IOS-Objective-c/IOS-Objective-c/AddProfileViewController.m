//
//  AddProfileViewController.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 14/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "AddProfileViewController.h"
#import "AFNetworking.h"
#import "Profile.h"
#import "RemoteService.h"

@interface AddProfileViewController ()

@end

@implementation AddProfileViewController
@synthesize firstName, lastName, birthDay, sex;

NSString *sexVar = @"male";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeText:(id)sender {

    if (sex.selectedSegmentIndex == 0) {
        sexVar = @"male";
    }
    if (sex.selectedSegmentIndex == 1) {
        sexVar = @"female";
    }
}

- (IBAction)signIn:(id)sender {
    Profile *profile = profile = [[Profile alloc] init];

    profile.firstnameInput = firstName.text;
    profile.lastnameInput = lastName.text;
    
    NSDate *birthDayInput = [birthDay date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    profile.DateInput =[formatter stringFromDate:birthDayInput];
    
    profile.sexInput = sexVar;
    
    RemoteService *remoteService = [[RemoteService alloc] init];
    
    [remoteService submitProfile:profile];
}

@end
