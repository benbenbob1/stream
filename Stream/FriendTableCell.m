//
//  FriendTableCell.m
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import "FriendTableCell.h"

@implementation FriendTableCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setIdxLabelVal:(int)idx {
    profileIcon.clipsToBounds = YES;
    profileIcon.layer.masksToBounds = true;
    profileIcon.layer.cornerRadius = profileIcon.frame.size.width / 2.0;
    idxLabel.text = [NSString stringWithFormat:@"%i", idx + 1];
}

- (void)setName:(NSString *)name andScore:(int)score {
    NSNumberFormatter *numFormatter = [NSNumberFormatter new];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setGroupingSeparator:@","];
    NSString *scoreStr = [numFormatter stringFromNumber:[NSNumber numberWithInt:score]];

    NSMutableAttributedString *fullAttr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", name] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"GothamRounded-Light" size:15], NSForegroundColorAttributeName: [UIColor colorWithRed:2.0/255.0 green:52.0/255.0 blue:88.0/255 alpha:1.0]}];
    NSAttributedString *scoreAttr = [[NSAttributedString alloc] initWithString:scoreStr attributes:@{ NSFontAttributeName: [UIFont fontWithName:@"GothamRounded-Medium" size:20], NSForegroundColorAttributeName: [UIColor colorWithRed:2.0/255.0 green:52.0/255.0 blue:88.0/255 alpha:1.0]}];
    [fullAttr appendAttributedString:scoreAttr];
    nameScoreLabel.attributedText = fullAttr;
}

@end
