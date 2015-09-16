//
//  UpdateVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "DetailsVC.h"

@interface DetailsVC ()

@end

@implementation DetailsVC
@synthesize user;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Details";
    //NSLog(@"user name %@",user.userName);
    self.tfUserID.text = [NSString stringWithFormat:@"%li",user.userID];
    self.tfUserName.text = user.userName;
    self.tfPassword.text = user.passWord;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
