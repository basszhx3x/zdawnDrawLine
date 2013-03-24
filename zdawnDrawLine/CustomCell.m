//
//  CustomCell.m
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize titleLable = _titleLable;
@synthesize imagView=_imagView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
