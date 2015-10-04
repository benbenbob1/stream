//
//  FriendsPage.h
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "NavPage.h"
#import "FriendTableCell.h"

@interface FriendsPage : NavPage <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *devicesView;
    NSMutableArray *friends;
}

@end
