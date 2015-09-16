//
//  LoginVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

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

#pragma -mark LOG_IN
-(void) logIn{
    
//    MySingleton * singleton = [MySingleton getInstance];
//    singleton.kulUsers = [singleton.kulUsersDict objectForKey:DictKUserKey];
//    NSLog(@"String: %@",[singleton.kulUsersDict objectForKey:DictKUserKey]);
//    NSLog(@"arr user login %li",singleton.kulUsers.count);
//    
//    for (KulUser * user in singleton.kulUsers) {
//        if ([userName isEqualToString:user.userName] && [passWord isEqualToString:user.passWord]) {
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign in success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
//            [alert show];
//            //[self performSegueWithIdentifier:@"pushDetail" sender:self];
//        }
//        else{
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Log in fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//            [alert show];
//        }
//    }
    
    NSMutableURLRequest * request = [self configRequest];
    KulUser * user = [[KulUser alloc] init];
    NSURLSession *session = [NSURLSession sharedSession];
    //chay qua thread khac de request
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //ve lai main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            
        
        NSDictionary * dicts = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSInteger result = [[dicts objectForKey:@"e"] integerValue];
        if (result == 0) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign in success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
            [alert show];
            NSDictionary * objDict = [dicts objectForKey:@"r"];
            
            user.userID = [[objDict objectForKey:@"UserID"] integerValue];
            user.userName = [objDict objectForKey:@"UserName"];
            [self performSegueWithIdentifier:@"pushDetail" sender:user];
//            NSLog(@"%li",user.userID);
//            NSLog(@"%@",user.userName);

        } else {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Log in fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        NSLog(@"%@",dicts);
            });
    }]resume];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"pushDetail"]) {
        DetailsVC * detailsVC = segue.destinationViewController;
        detailsVC.user = sender;
    }
}

- (NSMutableURLRequest *) configRequest{
    NSString * userName = _tfUserName.text;
    NSString * passWord = _tfPassword.text;
    NSString * md5Pass = [passWord kulMd5String];
    NSURL * url = [NSURL URLWithString:API_Login];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"USER_AGENT" forHTTPHeaderField:@"User_Agent"];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSString * clientIP = ClientIP;
    
    NSString * clientOS = ClientOS;
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:DATE_FORMAT];
    NSString * time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString * sign = [NSString stringWithFormat:@"%@%@%@",userName,md5Pass,time];
    NSString * sha256Sign = [sign kulHMACStringWithKey:SECRET_KEY];
    
    NSString * appKey =APP_KEY;
    
    NSString *post = [NSString stringWithFormat:POST_STRING,userName,md5Pass,clientIP,clientOS,time,sha256Sign,appKey];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:postData];
    return request;
    
}


- (IBAction)btnLogin_Tapped:(id)sender {
    [self logIn];
}
@end
