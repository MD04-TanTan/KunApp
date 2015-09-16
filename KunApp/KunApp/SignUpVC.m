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

- (void) SignUp{
    NSString * userName = self.tfUserName.text;
    NSString * passWord = self.tfPassword.text;
    
    
//    NSInteger sex = self.sgmSex.selectedSegmentIndex;
//    NSInteger phone = (NSInteger ) self.tfPhone.text.integerValue;
    
    if (![userName isEqualToString:@""] && ![passWord isEqualToString:@""]) {
        
        
//        KulUser * user = [[KulUser alloc] initKulUserWithUserName:userName withPass:passWord withSex:sex withPhone:phone];
//        NSLog(@"user name %@",user.userName);
//        NSLog(@"sex: %li ",user.sex);
//        NSLog(@"phone: %li",user.phoneNumber);
//        if (user) {
//            
//            MySingleton * singleton = [MySingleton getInstance];
//            //Add user to array
//            [singleton.kulUsers addObject:user];
//            if (singleton.kulUsers != nil) {
//                
//                //Add array to dictionary
//                [singleton.kulUsersDict setObject:singleton.kulUsers forKey:DictKUserKey];
//
//            }
//        }
        NSURL * url = [NSURL URLWithString:API_CreateUser];
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
        [request setValue:@"USER_AGENT" forHTTPHeaderField:@"User_Agent"];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        NSString * md5Password = [passWord kulMd5String];
        NSString * clientIP = ClientIP;
        NSString * clientOS = ClientOS;
        
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:DATE_FORMAT];
        NSString * time = [dateFormatter stringFromDate:[NSDate date]];
        
        NSString * sign = [NSString stringWithFormat:@"%@%@%@",userName,md5Password,time];
        NSString * sha256Sign = [sign kulHMACStringWithKey:SECRET_KEY];

        NSString * appKey = APP_KEY;
        
        NSString * post = [NSString stringWithFormat:POST_STRING,userName,md5Password,clientIP,clientOS,time,sha256Sign,appKey];
        NSData * postData = [post dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        
        NSURLSession * session = [NSURLSession sharedSession];
        [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSMutableDictionary * dicts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@",dicts);
            NSInteger result = [[dicts objectForKey:@"e"] integerValue];
            if (result == 0) {
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
                alert.tag = 1;
                [alert show];
            } else {
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
        }] resume];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1 &&buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)btnSignUp_Tapped:(id)sender {

    [self SignUp];
}

@end
