//
//  FriendTableCell.h
//  Stream
//
//  Created by Ben Brown on 10/4/15.
//  Copyright (c) 2015 Ben Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendTableCell : UITableViewCell {
    IBOutlet UILabel *idxLabel;
    IBOutlet UILabel *nameScoreLabel;
    IBOutlet UIImageView *profileIcon;
    IBOutlet UIImageView *arrowImg;
}

- (void)setIdxLabelVal:(int)idx;
- (void)setName:(NSString *)name andScore:(int)score;

@end
