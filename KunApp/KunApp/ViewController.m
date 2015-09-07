//
//  ViewController.m
//  KunApp
//
//  Created by Tan Tan on 9/7/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initApp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initApp{
    UIButton * mainButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
    mainButton.layer.cornerRadius = 25.0f;
    [mainButton setBackgroundColor:[UIColor yellowColor]];
    [mainButton setTitle:@"Kun" forState:UIControlStateNormal];
    [mainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [mainButton addTarget:self action:@selector(btnKunTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mainButton];
}



- (IBAction)btnKunTapped :(id)sender{
    
    NSLog(@"click");
}

@end
