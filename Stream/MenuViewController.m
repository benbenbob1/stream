//
//  MenuViewController.m
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "MenuViewController.h"
#import "Config.h"

@implementation MenuViewController

+ (CGFloat)buttonSize {
    return 140.0;
}

- (id)initWithContainerView:(ContainerViewController *)theCVC {
    self = [super init];
    if (self) {
        cvc = theCVC;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat buttonSize = [MenuViewController buttonSize];
    
    UIButton *mainButton = [[UIButton alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, buttonSize, buttonSize)];
    [mainButton setImage:[UIImage imageNamed:@"stream"] forState:UIControlStateNormal];
    [mainButton addTarget:cvc action:@selector(streamButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:mainButton];
    
    UIButton *friendsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(mainButton.frame), buttonSize, buttonSize)];
    [friendsButton setImage:[UIImage imageNamed:@"friends-alt"] forState:UIControlStateNormal];
    [self.view addSubview:friendsButton];
    [friendsButton addTarget:cvc action:@selector(friendsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *communityButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(friendsButton.frame), buttonSize, buttonSize)];
    [communityButton setImage:[UIImage imageNamed:@"community-alt"] forState:UIControlStateNormal];
    [self.view addSubview:communityButton];
    
    UIButton *settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(communityButton.frame), buttonSize, buttonSize)];
    [settingsButton setImage:[UIImage imageNamed:@"settings-alt"] forState:UIControlStateNormal];
    [self.view addSubview:settingsButton];
}

@end
