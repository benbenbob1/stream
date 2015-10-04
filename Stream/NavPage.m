//
//  NavPage.m
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "NavPage.h"
#import "Config.h"

@implementation NavPage

- (void)viewDidLoad {
    //self.view.backgroundColor = [UIColor whiteColor];
    CGFloat navBarHeight = 90.0f;
    navBarHeight -= STATUS_BAR_HEIGHT;
    navBarView = [[UIView alloc] initWithFrame:CGRectMake(-1, -1, self.view.frame.size.width+2.0, navBarHeight + 1.0)];
    navBarView.layer.borderColor = MAIN_GREY.CGColor;
    navBarView.layer.borderWidth = 1.0;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = navBarView.frame;
    effectView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [navBarView addSubview:effectView];
    navBarView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    
    [self.view addSubview:navBarView];
    
    titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, navBarView.frame.size.width, navBarView.frame.size.height - STATUS_BAR_HEIGHT)];
    titleView.text = self.title;
    titleView.textColor = DARK_BLUE;
    titleView.font = [UIFont fontWithName:@"GothamRounded-Book" size:18];
    titleView.textAlignment = NSTextAlignmentCenter;
    [navBarView addSubview:titleView];
    
    CGSize buttonSize = CGSizeMake(25, 25);
    menuButton = [[UIButton alloc] initWithFrame:CGRectMake(20, STATUS_BAR_HEIGHT/2.0 + (navBarHeight/2.0) - (buttonSize.height / 2.0), buttonSize.width, buttonSize.height)];
    [menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(menuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [navBarView addSubview:menuButton];
    
    self.view.clipsToBounds = YES;
    CALayer *leftBorder = [CALayer layer];
    leftBorder.borderColor = MAIN_GREY.CGColor;
    leftBorder.borderWidth = 1.0;
    leftBorder.frame = CGRectMake(0.0, -1.0, self.view.frame.size.width, self.view.frame.size.height + 2.0);
    [self.view.layer addSublayer:leftBorder];
    
    /*UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    panGesture.maximumNumberOfTouches = 1;
    [navBarView addGestureRecognizer:panGesture];*/
    
    /*for (NSString *family in [UIFont familyNames]) {
        NSLog(@"%@", family);
        for (NSString *name in [UIFont fontNamesForFamilyName:family]) {
            NSLog(@"  %@", name);
        }
    }*/
    
    menuOpen = false;
    menuWidth = 150.0;
}

- (NSString *)myTitle {
    return titleView.text;
}

- (void)setMyTitle:(NSString *)aTitle {
    aTitle = [aTitle uppercaseString];
    self.title = aTitle;
    titleView.text = aTitle;
}

- (void)panGesture:(UIPanGestureRecognizer *)rec {
    CGPoint translation = [rec translationInView:rec.view];
    
    //rec.view.center=CGPointMake(rec.view.center.x+translation.x, rec.view.center.y+ translation.y);
    if (!menuOpen) {
        CGFloat minX = self.view.frame.size.width/2.0 + menuWidth;
        CGFloat maxX = MIN(self.view.center.x + translation.x, minX);
        self.view.center = CGPointMake(maxX, self.view.center.y);
        if (self.view.frame.origin.x >= menuWidth) {
            menuOpen = true;
        }
    } else {
        CGFloat maxX = self.view.frame.size.width/2.0 + menuWidth;
        CGFloat minX = MIN(self.view.frame.size.width/2.0, maxX);
        self.view.center = CGPointMake(minX, self.view.center.y);
        if (self.view.frame.origin.x <= 0.0) {
            menuOpen = false;
        }
    }
    
    [rec setTranslation:CGPointMake(0, 0) inView:rec.view];
}

- (void)menuButtonPressed:(UIButton *)sender {
    CGRect oldFrame = self.view.frame;
    if (menuOpen) {
        oldFrame.origin.x = 0.0;
    } else {
        oldFrame.origin.x = menuWidth;
    }
    
    menuOpen = !menuOpen;
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.frame = oldFrame;
    } completion:^(BOOL finished) {
        //
    }];
    
}

@end
