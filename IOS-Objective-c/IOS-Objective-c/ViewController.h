//
//  ViewController.h
//  IOS-Objective-c
//
//  Created by TechNetMedia on 12/05/2015.
//  Copyright (c) 2015 TechNetMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDay;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sex;


- (IBAction)signIn:(id)sender;
- (IBAction)changeText:(id)sender;
@end

