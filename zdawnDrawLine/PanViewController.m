//
//  PanViewController.m
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-18.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "PanViewController.h"
#import "PanView.h"
@interface PanViewController ()

@end

@implementation PanViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.view=[[[PanView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)]autorelease];
    self.view.backgroundColor=[UIColor whiteColor];


}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view removeFromSuperview];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
