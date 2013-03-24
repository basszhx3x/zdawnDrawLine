//
//  PanView.m
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-18.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "PanView.h"
#import <QuartzCore/QuartzCore.h>
@interface PanView ()

@property(nonatomic,retain)NSMutableArray *positions;

@end


@implementation PanView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _positions = [[NSMutableArray alloc]init];
        
        
    }
    return self;

}
-(void)dealloc
{
    [_positions release];
    [super dealloc];

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_positions addObject:[NSValue valueWithCGPoint:[[touches anyObject] locationInView:self]]];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_positions addObject:[NSValue valueWithCGPoint:[[touches anyObject] locationInView:self]]];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}
-(void)drawRect:(CGRect)rect
{
    if (_positions.count <= 0) {
        return ;
    }
    CGContextRef currentRef = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentRef, [UIColor redColor].CGColor);
    CGContextSetLineWidth(currentRef, 3.0f);
    for (int i=0; i< [_positions count]-1; i++) {
        NSValue *aValue = [_positions objectAtIndex:i];
        CGPoint pre = [aValue CGPointValue];
        NSValue *bValue = [_positions objectAtIndex:i+1];
        CGPoint loc = [bValue CGPointValue];
        CGContextMoveToPoint(currentRef, pre.x, pre.y);
        CGContextAddLineToPoint(currentRef, loc.x, loc.y);
    }
    
    CGContextStrokePath(currentRef);
    
}
-(void)setUpAnimation
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.values = _positions;
    keyAnimation.duration = 0.35;
    


}




@end
