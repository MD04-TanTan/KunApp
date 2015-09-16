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
#define API_CreateUserQuick @"http://apisdk-kietthm.kul.local/user/create-quick.html"
#define POST_STRING @"UserName=%@&Password=%@&ClientIP=%@&ClientOS=%@&Time=%@&Sign=%@&AppKey=%@"
#define POST_STRING_QUICKCREATE @"ClientIP=%@&ClientOS=%@&Time=%@&Sign=%@&AppKey=%@"
#define ClientIP @"192.168.4.45"
#define ClientOS @"ios"
#define DATE_FORMAT @"yyyyMMddhhmmss"
#define SECRET_KEY @"987654321"
#define APP_KEY @"123456789"

#import <UIKit/UIKit.h>
#import "KulUser.h"
#import "MySingleton.h"
#import "SignUpVC.h"
#import "HomeVC.h"
#import "LoginVC.h"
#import "DetailsVC.h"
#import "NSString+MD5.h"
#import "NSString+KulEncription.h"


@interface BaseVC : UIViewController

@end
