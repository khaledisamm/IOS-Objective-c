//
//  ViewController.m
//  IOS-Objective-c
//
//  Created by TechNetMedia on 12/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize firstName, lastName, birthDay, sex;

NSString *sexInput = @"male";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeText:(id)sender {
    if (sex.selectedSegmentIndex == 0) {
        sexInput = @"male";
    }
    if (sex.selectedSegmentIndex == 1) {
        sexInput = @"female";
    }
}

- (IBAction)signIn:(id)sender {
    
    NSString *firstNameInput = firstName.text;
    NSString *lastNameInput = lastName.text;
    NSDate *birthDayInput = [birthDay date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringDate =[formatter stringFromDate:birthDayInput];
    
    NSLog(@"%@, %@, %@, %@", firstNameInput, lastNameInput, stringDate, sexInput);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *params = @ {@"firstName" :firstNameInput, @"lastName" :lastNameInput, @"birthDay" :stringDate, @"sex" :sexInput };
    
    [manager POST:@"http://192.168.1.2/ios/public/profiles" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
}


@end
