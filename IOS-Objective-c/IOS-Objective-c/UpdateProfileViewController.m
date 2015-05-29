//
//  UpdateProfileViewController.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 20/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "UpdateProfileViewController.h"
#import "AFNetworking.h"
#import "Profile.h"
#import "RemoteService.h"
#import "MBProgressHUD.h"
#import "DisplayProfileTableViewController.h"

@interface UpdateProfileViewController ()

@end

@implementation UpdateProfileViewController
@synthesize profileUp, firstName, lastName, birthDay, sex;

NSString *sexVal;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    firstName.text = [profileUp valueForKey:@"firstName"];
    lastName.text = [profileUp valueForKey:@"lastName"];


    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateUp = [formatter dateFromString:(NSString *)[profileUp valueForKey:@"birthDay"]];
    if (dateUp) {
        birthDay.date = dateUp;
    }
    
    sexVal = (NSString *)[profileUp valueForKey:@"sex"];
    if ([sexVal  isEqual: @"male"]) {
        sex.selectedSegmentIndex = 0;
    }
    else {
        sex.selectedSegmentIndex = 1;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeText:(id)sender {
    if (sex.selectedSegmentIndex == 0) {
        sexVal = @"male";
    }
    if (sex.selectedSegmentIndex == 1) {
        sexVal = @"female";
    }
    NSLog(@"id=%@",self.profileUp);
}

- (IBAction)update:(id)sender {
    
    Profile *profile = [[Profile alloc] init];
    NSLog(@"id=%@",profileUp);
    profile.id=[[profileUp valueForKey:@"id"] intValue];
    profile.firstName=firstName.text;
    profile.lastName = lastName.text;
    
    NSDate *birthDayInput = [birthDay date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    profile.birthDay =[formatter stringFromDate:birthDayInput];
    
    profile.sex = sexVal;

    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"submit.in.progress", nil);

    RemoteService *remoteService = [[RemoteService alloc] init];
    
    [remoteService updateProfile:profile callback:^(id data) {
        [hud hide:YES];
        if(data)
            [self.navigationController popViewControllerAnimated:YES];
    }];
//


}
@end
