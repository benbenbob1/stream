//
//  ContainerViewController.m
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "ContainerViewController.h"

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    vc = [sb instantiateViewControllerWithIdentifier:@"ViewControllerID"];
    mvc = [[MenuViewController alloc] init];

    [self.view addSubview:mvc.view];
    [self.view addSubview:vc.view];
}

@end
