//
//  LineViewController.h
//  zdawnDrawLine
//
//  Created by Ibokan on 12-12-17.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;

    
    NSMutableArray *_data;
}


@end
