//
//  ContainerViewController.m
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "ContainerViewController.h"
#import "ViewController.h"
#import "MenuViewController.h"

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    vc = [sb instantiateViewControllerWithIdentifier:@"ViewControllerID"];
    mvc = [[MenuViewController alloc] initWithContainerView:self];

    [self.view addSubview:mvc.view];
    [self.view addSubview:vc.view];
}

- (void)streamButtonPressed {
    [vc.view removeFromSuperview];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    vc = [sb instantiateViewControllerWithIdentifier:@"ViewControllerID"];
    [self.view addSubview:vc.view];
}

- (void)friendsButtonPressed {
    [vc.view removeFromSuperview];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    vc = [sb instantiateViewControllerWithIdentifier:@"FriendViewID"];
    [self.view addSubview:vc.view];
}

@end
