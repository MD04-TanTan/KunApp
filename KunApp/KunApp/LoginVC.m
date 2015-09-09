//
//  LoginVC.m
//  KunApp
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC (){
    //NSMutableArray * kulUsers;
    //NSMutableDictionary * kulUsersDict;
}

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:YES];
   
    //kulUsersDict = [[NSMutableDictionary alloc] init];
    [self initLayout];
    //self.navigationItem.hidesBackButton = YES;

    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //NSLog(@"11111");
    
//    MySingleton * singleton = [MySingleton getInstance];
//    singleton.kulUsers = [singleton.kulUsers arrayByAddingObjectsFromArray:[singleton.kulUsersDict objectForKey:@"KulUser"]];
//    NSLog(@"arr user login %li",singleton.kulUsers.count);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initLayout{
    self.title = @"Log in";
    //kulUsers = [kulUsersDict objectForKey:@"KulUsers"];
    
     //NSLog(@"arr user login %li",kulUsers.count);
    
}


- (IBAction)btnLogin_Tapped:(id)sender {
    //[self performSegueWithIdentifier:@"pushDetail" sender:self];
}
@end
