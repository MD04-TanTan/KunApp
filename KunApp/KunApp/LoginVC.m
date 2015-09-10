//
//  LoginVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC (){

}

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:YES];
    self.title = @"Log in";
    //self.navigationItem.hidesBackButton = YES;

    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    

//    NSLog(@"String: %@",[singleton.kulUsersDict objectForKey:DictKUserKey]);
//    NSLog(@"arr user login %li",singleton.kulUsers.count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) logIn{
    NSString * userName = _tfUserName.text;
    NSString * passWord = _tfPassword.text;
    
    MySingleton * singleton = [MySingleton getInstance];
    singleton.kulUsers = [singleton.kulUsersDict objectForKey:DictKUserKey];
    NSLog(@"String: %@",[singleton.kulUsersDict objectForKey:DictKUserKey]);
    NSLog(@"arr user login %li",singleton.kulUsers.count);
    
    for (KulUser * user in singleton.kulUsers) {
        if ([userName isEqualToString:user.userName] && [passWord isEqualToString:user.passWord]) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign in success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
            [alert show];
            //[self performSegueWithIdentifier:@"pushDetail" sender:self];
        }
        else{
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Log in fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }
}


- (IBAction)btnLogin_Tapped:(id)sender {
    [self logIn];
}
@end
