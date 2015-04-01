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
    
    /*
    NSURL *streamURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
  
    [self.streamPlayer.view setFrame: CGRectMake(0, 0, 500, 200) ];
    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
    [self.contentView addSubview: self.streamPlayer.view];
    [self.streamPlayer play];
     */
   
}

- (void)viewDidAppear:(BOOL)animated{
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);

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
