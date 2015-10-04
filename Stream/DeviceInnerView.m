//
//  DeviceInnerView.m
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "DeviceInnerView.h"

@implementation DeviceInnerView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = MAIN_GREY.CGColor;
    }
    return self;
}

@end
