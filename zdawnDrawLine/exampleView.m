#import "exampleView.h"

@implementation exampleView
@synthesize titleValue =_titleValue;
- (id)initWithFrame:(CGRect)frame Title:(NSString *)aTitle
{
    self = [super initWithFrame:frame];
    if (self) {
       
        UILabel *aLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 150, 30)];
        aLable.text = aTitle;
        [self addSubview:aLable];
        [aLable release];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
    CGContextRef currentRef = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentRef, [UIColor colorWithRed:arc4random()%256 /255.0 green:arc4random()%256 /255.0 blue:arc4random()%256 /255.0 alpha:1.0f].CGColor);
    CGContextSetLineWidth(currentRef, 10.0f);
    CGContextSetLineJoin(currentRef, kCGLineJoinRound);
    
    CGContextAddRect(currentRef, self.bounds);
    
    CGContextStrokeRect(currentRef, self.bounds);
    [[UIColor purpleColor] set];
    
}
-(void)drawTitle
{
     
    [self setNeedsDisplay];

}




@end
