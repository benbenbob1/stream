//
//  ViewController.m
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell"];
    
    if (indexPath.row == 1) {
        UIView *addView = [cell showAddStream:true];
        if (addView) {
            if (!addView.gestureRecognizers.count) {
                UITapGestureRecognizer *tGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addButtonPressed:)];
                NSLog(@"%@, adding %@", addView, tGR);
                [addView addGestureRecognizer:tGR];
            }
        }
    } else {
        NSDateFormatter *df = [NSDateFormatter new];
        [df setDateFormat:@"EEE, MMM d, YYYY"];
        [cell setDateStr:[df stringFromDate:[NSDate date]]];
        [cell setCurGals:25];
        [cell setWeekData:[devices[indexPath.section] objectForKey:@"days"] withFrame:[tableView rectForRowAtIndexPath:indexPath]];
        [cell showAddStream:false];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, [self tableView:tableView heightForHeaderInSection:section])];
    headerView.backgroundColor = [UIColor whiteColor];
    
    CGFloat margin = 20.0;
    UILabel *leftField = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0, headerView.frame.size.width - margin, headerView.frame.size.height)];
    leftField.font = [UIFont fontWithName:@"GothamRounded-Medium" size:16];
    leftField.textColor = DARK_BLUE;
    leftField.text = [[devices[section] objectForKey:@"name"] uppercaseString];
    
    UILabel *rightField = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.frame.size.width - margin, headerView.frame.size.height)];
    rightField.font = [UIFont fontWithName:@"GothamRounded-Book" size:16];
    rightField.textColor = DARK_BLUE;
    rightField.textAlignment = NSTextAlignmentRight;
    NSString *pointsStr = [devices[section] objectForKey:@"points"];
    NSNumberFormatter *numFormatter = [NSNumberFormatter new];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setGroupingSeparator:@","];
    pointsStr = [numFormatter stringFromNumber:[NSNumber numberWithInteger:[pointsStr integerValue]]];
    rightField.text = [NSString stringWithFormat:@"%@ PTS", pointsStr];
    
    [headerView addSubview:leftField];
    [headerView addSubview:rightField];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return devices.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == devices.count - 1 && section < 3) {
        return 2;
    }
    return 1;
}

- (void)addButtonPressed:(id)sender {
    NSLog(@"ABP");
    [devices addObject:@{@"name": @"Downstairs Toilet",
                         @"points": @"923455",
                         @"days": @[
                                 @{@"date": @"9/29/15",
                                   @"value": @"3"},
                                 @{@"date": @"9/30/15",
                                   @"value": @"0"},
                                 @{@"date": @"10/1/15",
                                   @"value": @"4"},
                                 @{@"date": @"10/2/15",
                                   @"value": @"8"},
                                 @{@"date": @"10/3/15",
                                   @"value": @"10"},
                                 @{@"date": @"10/4/15",
                                   @"value": @"4"}
                                 ]
                         }];
    [devicesView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTitle = @"Stream";
    
    devices = [NSMutableArray arrayWithArray:@[
                                               @{@"name": @"Kitchen Sink",
                                                 @"points": @"21230",
                                                 @"days": @[
                                                         @{@"date": @"9/29/15",
                                                           @"value": @"39.95"},
                                                         @{@"date": @"9/30/15",
                                                           @"value": @"25.8"},
                                                         @{@"date": @"10/1/15",
                                                           @"value": @"36.1"},
                                                         @{@"date": @"10/2/15",
                                                           @"value": @"25.6"},
                                                         @{@"date": @"10/3/15",
                                                           @"value": @"24.65"},
                                                         @{@"date": @"10/4/15",
                                                           @"value": @"8.19"}
                                                         ]
                                                 }
                                               ]];
    //devicesView.frame = CGRectMake(0, navBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - navBarView.frame.size.height);
    devicesView.contentInset = UIEdgeInsetsMake(navBarView.frame.size.height - 1.0, 0.0, 0.0, 0.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
