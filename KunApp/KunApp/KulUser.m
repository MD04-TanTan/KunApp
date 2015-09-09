//
//  KulUser.m
//  KunApp
//
//  Created by Tan Tan on 9/9/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "KulUser.h"

@implementation KulUser

- (KulUser *)initKulUserWithUserName:(NSString *)username withPass:(NSString *)pass withSex:(NSInteger)sex withPhone:(NSInteger)phone{
    KulUser * user = [[KulUser alloc] init];
    user.userName = username;
    user.passWord = pass;
    user.sex = sex;
    user.phoneNumber = phone;
    return user;
}

@end
