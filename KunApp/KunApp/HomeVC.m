//
//  ViewController.m
//  KunApp
//
//  Created by Tan Tan on 9/7/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC (){
    CGFloat mWidth;
    CGFloat mHeight;
}

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self initKul];
    //self.view.userInteractionEnabled=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}
#pragma -mark init Layout
- (void)initKul{
    mWidth = [UIScreen mainScreen].bounds.size.width;
    mHeight = [UIScreen mainScreen].bounds.size.height;
    self.title  = @"HOME";
    
    
    [self initButtonKul];
    [self initMenu];
    
}

- (void) initButtonKul{
    UIButton * mainButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
    mainButton.layer.cornerRadius = 25.0f;
    [mainButton setBackgroundColor:[UIColor yellowColor]];
    [mainButton setTitle:@"Kun" forState:UIControlStateNormal];
    [mainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [mainButton addTarget:self action:@selector(btnKulTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mainButton];
}

-(void) initMenu{
    CGFloat size = 50;
    CGFloat position = mWidth/2 - 75;
    
    //UIColor *blue1 = [UIColor colorWithRed:62 green:146 blue:255 alpha:1];
    //Button 1
    UIButton * btnPlayDId = [[UIButton alloc] initWithFrame:CGRectMake(position, size*2, size*3, size - 20)];
    [btnPlayDId setBackgroundColor:[UIColor blueColor]];
    [btnPlayDId setTitle:@"Play With DId" forState:UIControlStateNormal];
    [btnPlayDId setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:btnPlayDId];
    
    //Button 2
    UIButton * btnPlayNow = [[UIButton alloc] initWithFrame:CGRectMake(position, size*3, size*3, size - 20)];
    [btnPlayNow setBackgroundColor:[UIColor blueColor]];
    [btnPlayNow setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btnPlayNow setTitle:@"Play Now" forState:UIControlStateNormal];
    [self.view addSubview:btnPlayNow];
    
    //Button 3
    UIButton * btnLogin = [[UIButton alloc] initWithFrame:CGRectMake(position, size*4, size*3, size - 20)];
    [btnLogin setBackgroundColor:[UIColor blueColor]];
    [btnLogin setTitle:@"Log in" forState:UIControlStateNormal];
    [btnLogin setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btnLogin addTarget:self action:@selector(btnLoginTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
}


- (IBAction)btnKulTapped :(id)sender{
    
    NSLog(@"kul click");
}

- (IBAction)btnLoginTapped:(id)sender{
    //NSLog(@"aaaaa");
    //LoginVC * loginVC = [[LoginVC alloc] init];
    [self performSegueWithIdentifier:@"pushLogin" sender:self];

}



@end
