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
#import "MBProgressHUD.h"
#import "DisplayProfileTableViewController.h"


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
    Profile *profile = [Profile new];

    profile.firstName = firstName.text;
    profile.lastName = lastName.text;
    
    NSDate *birthDayInput = [birthDay date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    profile.birthDay =[formatter stringFromDate:birthDayInput];
    
    profile.sex = sexVar;
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:birthDayInput
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    
    if (age<5) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Erreur"
                                                         message:@"Age is down 5 year"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }else
    
    if (!firstName.text.length && !lastName.text.length) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Erreur"
                                                         message:@"FirstName is empty & LastName is empty"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }else if (!firstName.text.length) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Erreur"
                                                         message:@"FirstName is empty"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    } else if (!lastName.text.length) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Erreur"
                                                         message:@"LastName is empty"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: nil];
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    } else {
        MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = NSLocalizedString(@"submit.in.progress", nil);
        
        RemoteService *remoteService = [[RemoteService alloc] init];
        
        [remoteService submitProfile:profile callback:^(id data) {
            [hud hide:YES];
            if(data)
                [self.navigationController popViewControllerAnimated:YES];
        }];
    }
}

@end
