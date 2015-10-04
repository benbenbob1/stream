//
//  FriendsPage.m
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "FriendsPage.h"

@implementation FriendsPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTitle = @"Friends";
    devicesView.contentInset = UIEdgeInsetsMake(navBarView.frame.size.height - 1.0, 0.0, 0.0, 0.0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    switch (indexPath.row) {
        case 0:
            [cell setName:@"Burak Aslan" andScore:92000];
            break;
        case 1:
            [cell setName:@"Ben Brown" andScore:83441];
            break;
        case 2:
            [cell setName:@"Michael Timbrook" andScore:55955];
            break;
    }
    [cell setIdxLabelVal:(int)indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
