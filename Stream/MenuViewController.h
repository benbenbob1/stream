//
//  MenuViewController.h
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"

@interface MenuViewController : UIViewController {
    ContainerViewController *cvc;
    UIButton *selected;
}

+ (CGFloat)buttonSize;
- (id)initWithContainerView:(ContainerViewController *)theCVC;

@end
