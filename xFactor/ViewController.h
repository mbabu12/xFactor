//
//  ViewController.h
//  xFactor
//
//  Created by NextepMac on 3/30/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    BOOL first;
    NSMutableArray * arr;
    int time;
    NSTimer *timer;
    BOOL downloaded;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) MPMoviePlayerViewController *streamPlayerr;

@property (weak, nonatomic) IBOutlet UILabel *day1;
@property (weak, nonatomic) IBOutlet UILabel *day2;
@property (weak, nonatomic) IBOutlet UILabel *hour1;
@property (weak, nonatomic) IBOutlet UILabel *hour2;
@property (weak, nonatomic) IBOutlet UILabel *minutes1;
@property (weak, nonatomic) IBOutlet UILabel *minutes2;
@property (weak, nonatomic) IBOutlet UILabel *seconds1;
@property (weak, nonatomic) IBOutlet UILabel *seconds2;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIView *liveView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UIImageView *loader;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *noInternetLabel;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@end

