//
//  ViewController.m
//  xFactor
//
//  Created by NextepMac on 3/30/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "HeaderTableViewCell.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.scrollView.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.scrollEnabled = NO;
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
    self.scrollView.tag = 1;
    first = NO;
   
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    /*
    NSURL *streamURL = [NSURL URLWithString:@"http://vod03.silk.myvideo.ge/secure/254/2539738.mp4?key=0dxKh2HSOv2Ck-WzFEzTqQ&ttl=1427980876&start=0"];
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
  
    [self.streamPlayer.view setFrame: CGRectMake(0, 0, 500, 200) ];
    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
    [self.contentView addSubview: self.streamPlayer.view];
    [self.streamPlayer play]; */
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    if(!first){
        first = YES;
        self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
    }
    self.scrollView.scrollEnabled = YES;
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
}

- (void)playbackDidFinish:(NSNotification *)notification{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.bounds.origin.y == 142 & scrollView.tag == 1){
        self.tableView.scrollEnabled = YES;
    }
    if(scrollView.bounds.origin.y == 0 & scrollView.tag == 1){
        self.tableView.scrollEnabled = NO;
    }
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 58;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *simpleTableIdentifier = @"HeaderTableViewCell";
    HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.backgroundColor = [UIColor clearColor];

    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MainTableViewCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *streamURL = [NSURL URLWithString:@"http://vod03.silk.myvideo.ge/secure/254/2539738.mp4?key=0dxKh2HSOv2Ck-WzFEzTqQ&ttl=1427980876&start=0"];
    _streamPlayerr = [[MPMoviePlayerViewController alloc] initWithContentURL:streamURL];
    
    [self presentMoviePlayerViewControllerAnimated:_streamPlayerr];

    
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/*
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // Add your Colour.
    MainTableViewCell *cell = (MainTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:25.0/255.0 blue:32.0/255.0 alpha:0.8]];  //highlight colour
    [cell setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:25.0/255.0 blue:32.0/255.0 alpha:0.8]];
  //  [cell.contentView setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:25.0/255.0 blue:32.0/255.0 alpha:0.8]];
 
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    // Reset Colour.
    MainTableViewCell *cell = (MainTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:17.0/255.0 green:25.0/255.0 blue:32.0/255.0 alpha:0.9]]; //normal color
    
}

*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
