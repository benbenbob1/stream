//
//  BarDayItemView.h
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface BarDayItemView : UIView {
    UIView *bar;
    UILabel *numView, *dayView;
}

- (void)setNum:(int)number;
- (void)setDay:(NSString *)day;

- (void)setSelected:(BOOL)selected;

@end
