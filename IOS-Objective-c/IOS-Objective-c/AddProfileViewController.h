//
//  AddProfileViewController.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 14/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;


- (IBAction)signIn:(id)sender;
- (IBAction)changeText:(id)sender;




@end
