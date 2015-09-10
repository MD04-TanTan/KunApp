//
//  SignUpVC.h
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface SignUpVC :UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmSex;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;

@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

- (IBAction)btnSignUp_Tapped:(id)sender;


@end
