//
//  DeviceTableViewCell.h
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceInnerView.h"
#import "BarDayItemView.h"

@interface GalView : UIView {
    IBOutlet UILabel *curGalLabel, *galLabel;
}

- (void)setGalLabelStr:(NSString *)str;

@end

@interface DeviceTableViewCell : UITableViewCell {
@public
    IBOutlet DeviceInnerView *innerView;
    IBOutlet UILabel *curDateLabel;
    IBOutlet GalView *galView;
    UIImageView *imgView;
    NSMutableArray *dayArr;
    NSArray *someWeekData;
}


- (void)selectDay:(BarDayItemView *)itemView;
- (void)selectWeekItem:(UITapGestureRecognizer *)rec;
- (void)setWeekData:(NSArray *)weekData withFrame:(CGRect)rect;
- (UIView *)showAddStream:(BOOL)yesOrNo;
- (void)setCurDate:(NSDate *)date;
- (void)setDateStr:(NSString *)str;
- (void)setCurGals:(double)curGals;

@end
