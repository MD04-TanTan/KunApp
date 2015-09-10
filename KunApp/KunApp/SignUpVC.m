//
//  SignUpVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"Sign Up";
    //[self.btnSignUp setEnabled:NO];
    
    //_kulUsersDict = [[NSMutableDictionary alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initSignUp{
    NSString * userName = self.tfUserName.text;
    NSString * passWord = self.tfPassword.text;
    NSInteger sex = self.sgmSex.selectedSegmentIndex;
    NSInteger phone = (NSInteger ) self.tfPhone.text.integerValue;
    
    if (![userName isEqualToString:@""] && ![passWord isEqualToString:@""]) {
        
        
        KulUser * user = [[KulUser alloc] initKulUserWithUserName:userName withPass:passWord withSex:sex withPhone:phone];
        NSLog(@"user name %@",user.userName);
        NSLog(@"sex: %li ",user.sex);
        NSLog(@"phone: %li",user.phoneNumber);
        if (user) {
            
            MySingleton * singleton = [MySingleton getInstance];
            //Add user to array
            [singleton.kulUsers addObject:user];
            if (singleton.kulUsers != nil) {
                
                //Add array to dictionary
                [singleton.kulUsersDict setObject:singleton.kulUsers forKey:DictKUserKey];

            }
            
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
            alert.tag = 1;
            [alert show];
            NSLog(@"array %li ",singleton.kulUsers.count);
            NSLog(@"dictionary %@ ",[singleton.kulUsersDict objectForKey:DictKUserKey]);
            
            //Update
            self.tfUserName.text = nil;
            self.tfPassword.text = nil;
            //self.sgmSex.selectedSegmentIndex = 0;
            self.tfPhone.text = nil;
        }
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Sign up fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1 &&buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)btnSignUp_Tapped:(id)sender {
//    if([self.tfUserName.text isEqualToString:@""] || [self.tfPassword.text isEqualToString:@""])
//    {
//        NSLog(@"NULLLL");
//    }
    [self initSignUp];
}

@end
