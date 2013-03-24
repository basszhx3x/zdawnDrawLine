

#import "DawnMenuViewController.h"
#define Kframe(x,y,width,height) CGRectMake(x,y,width,height)
#define CreatUiView(x,y,width,height) [[[exampleView alloc]initWithFrame:CGRectMake(x,y,width,height)]autorelease]
#import "exampleView.h"
#import "LineViewController.h"
#import "ThreeViewAnimationController.h"
#import "PanViewController.h"

@interface DawnMenuViewController () 
@property(nonatomic,retain)NSArray *viewArray;
@property(nonatomic,assign)UIScrollView *rootScrollView;
@end
typedef NS_ENUM(NSInteger, UIViewInt)
{   UIView0,
    UIView1,
    UIView2,
    UIView3,
    UIView4,
    UIView5,
    UIView6,
    UIView7
}viewIndex;
@implementation DawnMenuViewController



-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];

    self.view=[[[UIView alloc]initWithFrame:CGRectMake(100, 100, 220, 380)]autorelease];
    self.view.backgroundColor=[UIColor blackColor];
    
    
    self.title = @"Menu";
       
    self.rootScrollView = [[UIScrollView alloc]initWithFrame:Kframe(0, 20, 320, 400)];
    
    self.rootScrollView.userInteractionEnabled =YES;
    NSArray *titleArray = [NSArray arrayWithObjects:@"三个VIew连续动画",@"B",@"C",@"D",@"E",@"F",@"G",@"H",nil];
    for (int i=0; i<8; i++) {
        exampleView *aView = [[exampleView alloc]initWithFrame:Kframe(0, 100*i, 320, 100) Title:[NSString stringWithString:[titleArray objectAtIndex:i]]];
 
        aView.backgroundColor = [UIColor whiteColor];
        aView.userInteractionEnabled = YES;

        UITapGestureRecognizer *aTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [aView addGestureRecognizer:aTap];
        
        [self.rootScrollView addSubview:aView];
        [aTap release];
        [aView release];
    }
    self.rootScrollView.contentSize = CGSizeMake(320, 100*8);
    [self.view addSubview:self.rootScrollView];
    
  
    

}


-(void)tapAction:(UITapGestureRecognizer *)aTapGRe 
{    
    
    viewIndex = [self.rootScrollView.subviews indexOfObject:aTapGRe.view];
    
    switch (viewIndex) {
        case 0:
        {   
            ThreeViewAnimationController * aThreeAnimation = [[ThreeViewAnimationController alloc]init];
            [self.navigationController pushViewController:aThreeAnimation animated:YES];
            [aThreeAnimation release];
            break;
        }
        case 1:
        {
            LineViewController *aLineController = [[LineViewController alloc]init];
            [self.navigationController pushViewController:aLineController animated:YES];
            [aLineController release];
            break;
        
        }
        case 2:
        {   PanViewController *aPan = [[PanViewController alloc]init];
            [self.navigationController pushViewController:aPan animated:YES];
            [aPan release];
            break;
        }
            case 3:
        {
           
        }
        default:
            break;
    }
    

}

-(void)viewDidDisappear:(BOOL)animated
{

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
