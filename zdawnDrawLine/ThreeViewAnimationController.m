//
//  ThreeViewAnimationController.m
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-18.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ThreeViewAnimationController.h"
#import <QuartzCore/QuartzCore.h>
@interface ThreeViewAnimationController ()
@property(nonatomic,assign)NSTimer *aTime;
@end

@implementation ThreeViewAnimationController



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view=[[[UIView alloc]initWithFrame:CGRectMake(100, 100, 220, 380)]autorelease];
    self.view.backgroundColor=[UIColor whiteColor];

    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"w_mengchong.jpg"];
    [self.view addSubview:_imageView];

    UIButton *aBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    aBtn.frame = CGRectMake(140, 350, 100, 30);
    [aBtn addTarget:self action:@selector(timeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aBtn];
    
    
  //  _aTime = [NSTimer scheduledTimerWithTimeInterval:0.35 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];


}
-(void)timeAction:(id)sender
{
//    [UIView animateWithDuration:0.35 animations:^{
//        _imageView.frame = CGRectMake(0, 0, 200, 200);
//    } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.35 animations:^{
//               _imageView.center = CGPointMake(150, 200) ;
//            }];
//    }];
    
    CAAnimation * cAni = [self createScale];
    CAAnimation * bAni = [self creatRotation];
    //一
    // [_imageView.layer addAnimation:bAni forKey:@"animation-1"];
     //二
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:cAni,bAni, nil];
    group.repeatCount = HUGE_VALF;
    group.duration = 1;
    
    
    
    [_imageView.layer addAnimation:group forKey:@"g-Ani"];
    
    
}
-(CAAnimation *)createScale
{
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    baseAnimation.toValue = [NSNumber numberWithFloat:2.0];
    baseAnimation.autoreverses =YES;
    baseAnimation.duration = 0.5;
    
    return baseAnimation;
}
-(CAAnimation *)creatRotation
{
    CABasicAnimation *baseAni = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D  _3d = CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0);
    baseAni.toValue = [NSValue valueWithCATransform3D:_3d];
    baseAni.autoreverses =YES;
    baseAni.repeatCount = HUGE_VALF;
    baseAni.duration =0.5;
    return baseAni;
}


-(void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
  //  [_aTime invalidate];
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
