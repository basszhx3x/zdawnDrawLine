
#import "LineViewController.h"
#define KFrame(x,y,width,height) CGRectMake(x,y,width,height)
#import "CustomCell.h"

@interface LineViewController ()

@end

@implementation LineViewController

-(void)loadView
{
    self.view=[[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)]autorelease];
    self.view.backgroundColor=[UIColor whiteColor];
    
    _tableView = [[UITableView alloc]initWithFrame:KFrame(0, 0, 320, 460-44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
    
    
}
-(void)dealloc
{
    [_data release];
    [super dealloc];

}
-(void)viewWillAppear:(BOOL)animated
{
    /*
    [super viewWillAppear:animated];
    NSArray *itemArray = @[@"+",@"-",@"*"];
    UISegmentedControl *aSegment = [[UISegmentedControl alloc]initWithItems:itemArray];
    aSegment.frame = CGRectMake(30, 0, 160, 30);
    aSegment.segmentedControlStyle = UISegmentedControlStylePlain;
    //aSegment.backgroundColor = [UIColor blueColor];
    //[aSegment setTitle:@"+" forSegmentAtIndex:2];
    [aSegment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
   // CGColorSpaceRef aColorApaceRef = CGColorSpaceCreateDeviceRGB();
    
    //const CGFloat *currComent = CGColorGetComponents(<#CGColorRef color#>)
    
   // aSegment.tintColor = [UIColor colorWithCGColor:<#(CGColorRef)#>];
    [self.view addSubview:aSegment];
    [aSegment release];

*/
    [super viewWillAppear:animated];
    _data = [NSMutableArray arrayWithObjects:@"1",@"3",@"2", nil];
    [_data retain];
    
    
}
-(void)segmentAction:(UISegmentedControl *)aSegMent
{
    if ([aSegMent selectedSegmentIndex] == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIndetifier= @"Kcell";
    CustomCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        /*
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier]autorelease];
        */
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:nil options:nil];
        cell = (CustomCell *)[nib objectAtIndex:0];
        /*
        cell.selectedBackgroundView = [[[UIView alloc]initWithFrame:cell.bounds]autorelease];
        
        
        cell.backgroundView = [[[UIView alloc]initWithFrame:cell.bounds]autorelease];
        */
    }
    
    //配置Cell

    cell.titleLable.text = [_data objectAtIndex:indexPath.row];
    
   // cell.accessoryView.transform = CGAffineTransformMakeRotation(M_PI);
    
    cell.imagView.image = [UIImage imageNamed:@"u=3477168534,3508143461&fm=25&gp=0.jpg"];
    
  //  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;

}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);

}
@end
