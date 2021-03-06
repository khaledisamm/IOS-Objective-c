//
//  UpdateProfileViewController.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 20/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface UpdateProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;

@property (nonatomic, strong) Profile *profileUp;


- (IBAction)changeText:(id)sender;
- (IBAction)update:(id)sender;
@end
