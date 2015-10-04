//
//  ContainerViewController.h
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuViewController;
@class ViewController;

@interface ContainerViewController : UIViewController {
    IBOutlet ViewController *vc;
    MenuViewController *mvc;
}

- (void)streamButtonPressed;
- (void)friendsButtonPressed;
- (void)communityButtonPressed;
- (void)settingsButtonPressed;

@end
