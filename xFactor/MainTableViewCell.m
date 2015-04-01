//
//  MainTableViewCell.m
//  xFactor
//
//  Created by NextepMac on 4/1/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib
{
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    selectedBackgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    selectedBackgroundView.backgroundColor = [UIColor colorWithRed:17.0/255.0 green:25.0/255.0 blue:32.0/255.0 alpha:0.8];
    self.selectedBackgroundView = selectedBackgroundView;
}

@end
