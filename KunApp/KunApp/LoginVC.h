//
//  LoginVC.h
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseVC.h"


@interface LoginVC : UIViewController

- (IBAction)btnLogin_Tapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end
