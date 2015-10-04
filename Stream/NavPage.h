//
//  NavPage.h
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface NavPage : UIViewController {
    UIView *navBarView, *menuView;
    UILabel *titleView;
    UIButton *menuButton;
    BOOL menuOpen;
    CGFloat menuWidth;
}

- (void)menuButtonPressed:(UIButton *)sender;
- (void)panGesture:(UIPanGestureRecognizer *)rec;

@property NSString *myTitle;

@end
