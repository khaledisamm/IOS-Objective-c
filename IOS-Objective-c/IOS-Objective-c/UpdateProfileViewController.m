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
@synthesize firstName, lastName, birthDay, sex, firstNameUp, lastNameUp, birthDayUp, sexUp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    firstName.text = firstNameUp;
    lastName.text = lastNameUp;

    NSString *kiki = @"2014-05-19";
    NSLog(@"%@",kiki);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *sosuso = [formatter dateFromString:kiki];
    birthDay.date = sosuso;


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
        sexUp = @"male";
    }
    if (sex.selectedSegmentIndex == 1) {
        sexUp = @"female";
    }
}

- (IBAction)update:(id)sender {
    
    Profile *profile = [[Profile alloc] init];
    RemoteService *remoteService = [[RemoteService alloc] init];
    
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"submit.in.progress", nil);

    [remoteService updateProfile:profile completion:^(Profile *profileResp) {
        [hud hide:YES];
        if(profileResp)
            [self.navigationController popViewControllerAnimated:YES];
    }];



}
@end
