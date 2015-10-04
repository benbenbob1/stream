//
//  DeviceTableViewCell.m
//  Stream
//
//  Created by Ben Brown on 10/3/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "DeviceTableViewCell.h"

@implementation GalView

- (void)setGalLabelStr:(NSString *)str {
    galLabel.textColor = DARK_BLUE;
    curGalLabel.textColor = DARK_BLUE;
    curGalLabel.text = str;
    
    NSMutableAttributedString *galMutAttr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName: [UIFont fontWithName:@"GothamRounded-Light" size:45]}];
    NSAttributedString *galAttr = [[NSAttributedString alloc] initWithString:@"GAL" attributes:
  @{
    NSFontAttributeName: [UIFont fontWithName:@"GothamRounded-Bold" size:12],
    NSBaselineOffsetAttributeName: [NSNumber numberWithFloat:23.0]
    }];
    [galMutAttr appendAttributedString:galAttr];
    curGalLabel.attributedText = galMutAttr;
}

@end

@implementation DeviceTableViewCell

- (void)showAddStream:(BOOL)yesOrNo {
    if (yesOrNo) {
        if (!imgView) {
            imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 70)];
            imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            imgView.image = [UIImage imageNamed:@"add-stream-button"];
            [imgView setContentMode:UIViewContentModeScaleAspectFit];
            [self addSubview:imgView];
        }
        imgView.hidden = false;
        innerView.hidden = true;
    } else {
        if (imgView) imgView.hidden = true;
        innerView.hidden = false;
    }
}

- (void)setWeekData:(NSArray *)weekData withFrame:(CGRect)rect {
    if (dayArr) {
        for (BarDayItemView *bDIV in dayArr) {
            [bDIV removeFromSuperview];
        }
        dayArr = nil;
    }
    dayArr = [NSMutableArray new];
    someWeekData = [NSArray arrayWithArray:weekData];
    CGFloat itemWidth = 40.0f;
    CGFloat margin = (rect.size.width - (itemWidth * (weekData.count + 1))) / (weekData.count + 2);
    CGFloat height = 190.0;
    CGFloat curX = margin + 25;
    NSDateFormatter *df = [NSDateFormatter new];
    
    for (int i=0; i<weekData.count; i++) {
        NSDictionary *dict = weekData[i];
        BarDayItemView *bDIV = [[BarDayItemView alloc] initWithFrame:CGRectMake(curX, CGRectGetMaxY(rect) - height - 40, itemWidth, height)];
        NSString *origDate = dict[@"date"];
        [df setDateStyle:NSDateFormatterShortStyle];
        NSDate *date = [df dateFromString:origDate];
        [df setDateFormat:@"E"];
        NSString *day = [df stringFromDate:date];
        [bDIV setDay:day];
        [bDIV setNum:[dict[@"value"] intValue]];
        [dayArr addObject:bDIV];
        [self addSubview:bDIV];
        curX += margin + itemWidth;
        
        UITapGestureRecognizer *tGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectWeekItem:)];
        [bDIV addGestureRecognizer:tGest];
    }
    
    if (dayArr.count) {
        BarDayItemView *today = dayArr.lastObject;
        [self selectDay:today];
    }
}

- (void)selectDay:(BarDayItemView *)itemView {
    int idx = -1, count = 0;
    for (BarDayItemView *iV in dayArr) {
        if ([itemView isEqual:iV]) {
            idx = count;
        }
        count ++;
        [iV setSelected:false];
    }
    [itemView setSelected:true];
    NSString *dateStr = [someWeekData[idx] objectForKey:@"date"];
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateStyle:NSDateFormatterShortStyle];
    NSDate *date = [df dateFromString:dateStr];
    [self setCurDate:date];
    [self setCurGals:[[someWeekData[idx] objectForKey:@"value"] intValue]];
}

- (void)selectWeekItem:(UITapGestureRecognizer *)rec {
    [self selectDay:(BarDayItemView *)rec.view];
}

- (void)setCurDate:(NSDate *)date {
    NSDateFormatter *df = [NSDateFormatter new];
    [df setDateFormat:@"EEE, MMM d, YYYY"];
    [self setDateStr:[df stringFromDate:date]];
}

- (void)setDateStr:(NSString *)str {
    curDateLabel.textColor = DARK_BLUE;
    curDateLabel.text = [str uppercaseString];
}

- (void)setCurGals:(int)curGals {
    [galView setGalLabelStr:[NSString stringWithFormat:@"%i", curGals]];
}

@end
