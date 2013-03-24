//
//  CustomCell.h
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UIImageView *_imagView;

   IBOutlet UILabel *_titleLable;
}
@property(nonatomic,assign)IBOutlet UILabel *titleLable;
@property(nonatomic,assign)IBOutlet UIImageView *imagView;
@end
