//
//  exampleView.h
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface exampleView : UIView
{
    NSString * _titleValue;
}
@property(nonatomic,retain)NSString * titleValue;
-(void)drawTitle;
- (id)initWithFrame:(CGRect)frame Title:(NSString *)aTitle;
@end
