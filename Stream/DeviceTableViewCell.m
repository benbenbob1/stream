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

- (UIView *)showAddStream:(BOOL)yesOrNo {
    if (yesOrNo) {
        if (!imgView) {
            imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 70)];
            imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            imgView.image = [UIImage imageNamed:@"add-stream-button"];
            [imgView setUserInteractionEnabled:true];
            [imgView setContentMode:UIViewContentModeScaleAspectFit];
            [self addSubview:imgView];
        }
        imgView.hidden = false;
        innerView.hidden = true;
        return imgView;
    } else {
        if (imgView) imgView.hidden = true;
        innerView.hidden = false;
        return nil;
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
    CGFloat curX = margin + 25;
    NSDateFormatter *df = [NSDateFormatter new];
    CGFloat maxHeight = 0.0, minHeight = 100.0;
    
    for (NSDictionary *dict in weekData) {
        int num = [dict[@"value"] intValue];
        if (num > maxHeight) {
            maxHeight = num;
        }
        if (num < minHeight) {
            minHeight = num;
        }
    }
    
    for (int i=0; i<weekData.count; i++) {
        NSDictionary *dict = weekData[i];
        int num = [dict[@"value"] intValue];
        CGFloat height = MIN(190, MAX(80, (num/maxHeight)*190.0));
        BarDayItemView *bDIV = [[BarDayItemView alloc] initWithFrame:CGRectMake(curX, CGRectGetHeight(rect) - height, itemWidth, height)];
        NSString *origDate = dict[@"date"];
        [df setDateStyle:NSDateFormatterShortStyle];
        NSDate *date = [df dateFromString:origDate];
        [df setDateFormat:@"E"];
        NSString *day = [df stringFromDate:date];
        [bDIV setDay:day];
        
        [bDIV setNum:num];
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
    [self setCurGals:[[someWeekData[idx] objectForKey:@"value"] doubleValue]];
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

- (void)setCurGals:(double)curGals {
    [galView setGalLabelStr:[NSString stringWithFormat:@"%.2f", curGals]];
}

@end
