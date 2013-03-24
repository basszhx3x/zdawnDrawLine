
#import "TableViewController.h"
#import "DawnMenuViewController.h"
@interface TableViewController ()
@property(nonatomic,retain) NSArray *students;
@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        _students = [NSArray arrayWithObjects:@"Lucas",@"zdawn",@"Lucy",@"Victor",@"Tony",@"king",@"123",@"5645",@"455",@"4645",@"978",@"456",nil];
        
        [_students retain];
        
        
        
        NSString *aStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Studentate" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",aStr);
        NSMutableDictionary *aDic = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]];
        NSLog(@"%@",aDic);
        
        
    }
    return self;
}
-(void)dealloc
{
    [_students release];
    [super dealloc];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//获得行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _students.count;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int height = 0.0;
    if (indexPath.row %2 == 0) {
        height = 44.0f;
    }
    else
        height = 100.0f;
    
    return height;
}
//分区标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

return @"IOS 43";

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 20.0f;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{

    return @"sec ios 43";
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UILabel *hView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    hView.text = @"IOS 43";
    hView.textAlignment = NSTextAlignmentCenter;
    hView.textColor = [UIColor purpleColor];
    hView.backgroundColor = [UIColor greenColor];
    return [hView autorelease];
}
//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    // Configure the cell...
    
    
    
    
    cell.textLabel.text = [_students objectAtIndex:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     DawnMenuViewController *detailViewController = [[DawnMenuViewController alloc] init];
     
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}

@end
