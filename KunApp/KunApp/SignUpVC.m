//
//  SignUpVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()
@property NSMutableData * data;

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
    NSInteger sex = self.sgmSex.selectedSegmentIndex;
    NSInteger phone = (NSInteger ) self.tfPhone.text.integerValue;
    
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
//            
//            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
//            alert.tag = 1;
//            [alert show];
//            NSLog(@"array %li ",singleton.kulUsers.count);
//            NSLog(@"dictionary %@ ",[singleton.kulUsersDict objectForKey:DictKUserKey]);
//            
//            //Update
//            self.tfUserName.text = nil;
//            self.tfPassword.text = nil;
//            //self.sgmSex.selectedSegmentIndex = 0;
//            self.tfPhone.text = nil;
//        }
        NSURL * url = [NSURL URLWithString:API_CreateUser];
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:userName forHTTPHeaderField:@"UserName"];
        [request setValue:passWord forHTTPHeaderField:@"Password"];
        [request setValue:@"fdsfds" forHTTPHeaderField:@"ClientIP"];
        [request setValue:@"ios" forHTTPHeaderField:@"ClientOS"];
        [request setValue:@"2015-09-15 17:57:00" forHTTPHeaderField:@"Time"];
        [request setValue:@"fhk423" forHTTPHeaderField:@"Sign"];
        [request setValue:@"123456789" forHTTPHeaderField:@"AppKey"];
        
        NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [connection start];
    }
    else
    {
        NSLog(@"Chua nhap UserName + Password");
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1 &&buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSMutableDictionary * dicts = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",dicts);
    NSInteger result = [[dicts objectForKey:@"e"] integerValue];
    if (result == 0) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:MESSAGE message:@"Sign up success!" delegate:self cancelButtonTitle:nil otherButtonTitles:OK, nil];
        alert.tag = 1;
        [alert show];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Sign up fail!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (IBAction)btnSignUp_Tapped:(id)sender {

    [self SignUp];
}

@end
