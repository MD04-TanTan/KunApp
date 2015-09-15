//
//  BaseVC.h
//  KunApp
//
//  Created by Tan Tan on 9/10/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#define DictKUserKey @"KulUser"
#define MESSAGE @"Message"
#define OK @"OK"
#define API_Login @"http://apisdk-kietthm.kul.local/user/login.html"
#define API_CreateUser @"http://apisdk-kietthm.kul.local/user/create.html"

#import <UIKit/UIKit.h>
#import "KulUser.h"
#import "MySingleton.h"
#import "SignUpVC.h"
#import "HomeVC.h"
#import "LoginVC.h"
#import "UpdateVC.h"

@interface BaseVC : UIViewController

@end
