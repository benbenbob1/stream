//
//  BarDayItemView.m
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "BarDayItemView.h"

@implementation BarDayItemView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *ltBlue = [UIColor colorWithRed:181.0/255.0 green:234.0/255.0 blue:255.0/255.0 alpha:1.0];
        
        numView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 25)];
        numView.textAlignment = NSTextAlignmentCenter;
        numView.text = @"27";
        numView.font = [UIFont fontWithName:@"GothamRounded-Bold" size:12];
        numView.textColor = ltBlue;
        [self addSubview:numView];
        
        bar = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numView.frame), frame.size.width, frame.size.height-25-40)];
        bar.backgroundColor = ltBlue;
        bar.layer.cornerRadius = 2.5f;
        [self addSubview:bar];
        
        dayView = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bar.frame), frame.size.width, 40)];
        dayView.textAlignment = NSTextAlignmentCenter;
        dayView.text = @"M";
        dayView.font = [UIFont fontWithName:@"GothamRounded-Book" size:12];
        dayView.textColor = BLUE_GREY;
        [self addSubview:dayView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        bar.backgroundColor = [UIColor colorWithRed:130.0/255.0 green:205.0/255.0 blue:235.0/255.0 alpha:1.0];
    } else {
        bar.backgroundColor = [UIColor colorWithRed:181.0/255.0 green:234.0/255.0 blue:255.0/255.0 alpha:1.0];
    }
}

- (void)setDay:(NSString *)day {
    dayView.text = [day uppercaseString];
}

- (void)setNum:(int)number {
    numView.text = [NSString stringWithFormat:@"%i", number];
}


@end
