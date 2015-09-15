//
//  LoginVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@property NSMutableData * data;

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
    
    NSURL * url = [NSURL URLWithString:API_Login];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"USER_AGENT" forHTTPHeaderField:@"User_Agent"];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    [request setValue:@"killcom1234" forHTTPHeaderField:@"UserName"];
    [request setValue:@"123456" forHTTPHeaderField:@"Password"];
    [request setValue:@"sdfsdf" forHTTPHeaderField:@"ClientIP"];
    [request setValue:@"asdasd" forHTTPHeaderField:@"ClientOS"];
    [request setValue:@"987654321" forHTTPHeaderField:@"Time"];
    [request setValue:@"sha256" forHTTPHeaderField:@"Sign"];
    [request setValue:@"123456789" forHTTPHeaderField:@"AppKey"];
    
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"Connect success");
    self.data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}



- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //TO DO
    NSDictionary * data = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",data);
    NSInteger result = [[data objectForKey:@"e"] integerValue];
    if (result == 0) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign in success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
        [alert show];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Log in fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    
}

- (IBAction)btnLogin_Tapped:(id)sender {
    [self logIn];
}
@end
