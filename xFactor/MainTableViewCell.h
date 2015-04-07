//
//  MainTableViewCell.h
//  xFactor
//
//  Created by NextepMac on 4/1/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) NSString * url;

@end
