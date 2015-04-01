//
//  ViewController.h
//  xFactor
//
//  Created by NextepMac on 3/30/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>
 #import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;

@end

