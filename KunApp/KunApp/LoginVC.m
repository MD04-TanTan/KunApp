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

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    
//    return self;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:YES];
    [self initLayout];
    //self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initLayout{
    self.title = @"Log in";

}


- (IBAction)btnLogin_Tapped:(id)sender {
    [self performSegueWithIdentifier:@"pushDetail" sender:self];
}
@end
