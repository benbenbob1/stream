//
//  ViewController.h
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavPage.h"
#import "DeviceTableViewCell.h"

@interface ViewController : NavPage <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *devicesView;
    UIButton *addButton;
    NSMutableArray *devices;
}

- (void)addButtonPressed:(id)sender;


@end

