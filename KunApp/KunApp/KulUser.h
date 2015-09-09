//
//  KulUser.h
//  KunApp
//
//  Created by Tan Tan on 9/9/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KulUser : NSObject

@property NSString * userName;
@property NSString * passWord;
@property NSInteger sex; //0 - Male/ 1 - Female
@property NSInteger phoneNumber;

- (KulUser *) initKulUserWithUserName:(NSString *) username withPass:(NSString *) pass withSex:(NSInteger ) sex withPhone:(NSInteger ) phone;

@end
