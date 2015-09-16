//
//  UpdateVC.h
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface DetailsVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tfUserID;

@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property KulUser * user;

@end
