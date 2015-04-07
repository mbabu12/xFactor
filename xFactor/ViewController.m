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
#import "AppDelegate.h"
#import "CellData.h"
#import "Reachability.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        [self.background setImage:[UIImage imageNamed:@"no internet.png"]];
        self.noInternetLabel.hidden = NO;
        self.logoView.hidden = YES;
        self.tableView.hidden = YES;
        self.timeView.hidden = YES;
        self.mainLabel.hidden = YES;
        self.liveView.hidden = YES;
        self.topView.hidden = YES;
        self.scrollView.scrollEnabled = NO;
    }
    
    else{
        [self.background setImage:[UIImage imageNamed:@"background.png"]];
        self.noInternetLabel.hidden = YES;
        self.logoView.hidden = NO;
        self.tableView.hidden = NO;
        self.timeView.hidden = NO;
        self.mainLabel.hidden = NO;
        self.topView.hidden = NO;
        self.scrollView.scrollEnabled = YES;
    
        UIImage *statusImage = [UIImage imageNamed:@"a0017.png"];
        [self.loader setImage:statusImage];
    
    
        //Add more images which will be used for the animation
        self.loader.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"a0016.png"],
                                   [UIImage imageNamed:@"a0015.png"],
                                   [UIImage imageNamed:@"a0014.png"],
                                   [UIImage imageNamed:@"a0013.png"],
                                   [UIImage imageNamed:@"a0012.png"],
                                   [UIImage imageNamed:@"a0011.png"],
                                   [UIImage imageNamed:@"a0010.png"],
                                   [UIImage imageNamed:@"a009.png"],
                                   [UIImage imageNamed:@"a008.png"],
                                   [UIImage imageNamed:@"a007.png"],
                                   [UIImage imageNamed:@"a006.png"],
                                   [UIImage imageNamed:@"a005.png"],
                                   [UIImage imageNamed:@"a004.png"],
                                   [UIImage imageNamed:@"a003.png"],
                                   [UIImage imageNamed:@"a002.png"],
                                   [UIImage imageNamed:@"a001.png"],
                                   [UIImage imageNamed:@"a000.png"],
                                   nil];
    
    
        //Start the animation
        self.loader.animationDuration = 0.5;
        [self.loader startAnimating];
    
        arr = [[NSMutableArray alloc] init];
        time = 0;
        downloaded = NO;
    
        self.liveView.hidden = YES;
    
        self.scrollView.delegate = self;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.scrollEnabled = NO;
        self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
        self.scrollView.tag = 1;
        first = NO;
   
        [self downloadData];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    }
}

- (void)downloadData{
    NSString *urlAsString = @"http://nextep.ge/beta/xfactor/ajax/GetNewVideos.php";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];

    
    [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        if(data != nil){
            [self parseJson:data];
        }
        
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    if(!first){
        first = YES;
        self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(0, self.view.bounds.size.height + 142);
}

- (void)parseJson:(NSData *)data{
    
    NSError *localError = nil;
    NSDictionary * all = [[NSDictionary alloc] init];
    all = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];

    if (localError != nil) {
        NSError * error = localError;
        NSLog(@"%@", error);
    }
    
    if(!downloaded){
        downloaded = YES;
        NSArray * videos = [[NSArray alloc] init];
        videos = all[@"videos"];

        for(int i = 0; i < [videos count]; i++){
            NSDictionary * temp = [videos objectAtIndex:i];
            CellData * newOne = [[CellData alloc] init];
            newOne.imageId = temp[@"id"];
            newOne.name = temp[@"name"];
            newOne.url = temp[@"url"];
            newOne.date = temp[@"date"];
            [arr addObject:newOne];
        }
        [self.tableView reloadData];
    }
    time = [all[@"time"] intValue];
    if(time > 0){
        self.liveView.hidden = YES;
        self.timeView.hidden = NO;
        self.mainLabel.hidden = NO;
    }
    [self countDownTimer];
}


- (void)countDownTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(time > 0 ){
        time -- ;
        int temp = time;
        int days =  temp / (60 * 60 * 24);
        temp -= days * (60 * 60 * 24);
        int hours = temp / (60 * 60);
        temp -= hours * (60 * 60);
        int minutes = temp / 60;
        temp -= minutes * 60;
        int seconds = temp;
        [self.day1 setText:[NSString stringWithFormat:@"%d", (days/10)]];
        [self.day2 setText:[NSString stringWithFormat:@"%d", (days%10)]];
        [self.hour1 setText:[NSString stringWithFormat:@"%d", (hours/10)]];
        [self.hour2 setText:[NSString stringWithFormat:@"%d", (hours%10)]];
        [self.minutes1 setText:[NSString stringWithFormat:@"%d", (minutes/10)]];
        [self.minutes2 setText:[NSString stringWithFormat:@"%d", (minutes%10)]];
        [self.seconds1 setText:[NSString stringWithFormat:@"%d", (seconds/10)]];
        [self.seconds2 setText:[NSString stringWithFormat:@"%d", (seconds%10)]];
    }
    else{
        self.timeView.hidden = YES;
        self.liveView.hidden = NO;
        self.mainLabel.hidden = YES;
        [timer invalidate];
        timer = nil;
        [self.liveView setAlpha:1.0f];
        
        //fade in
       
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut |
         UIViewAnimationOptionRepeat |
         UIViewAnimationOptionAutoreverse |
         UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             self.liveView.alpha = 0.5f;
                         }
                         completion:^(BOOL finished){
                             // Do nothing
                         }];
    }
}

- (IBAction)clickLive:(id)sender {
    NSURL *streamURL = [NSURL URLWithString:@"http://85.118.108.13/hls/xfactor.m3u8"];
    _streamPlayerr = [[MPMoviePlayerViewController alloc] initWithContentURL:streamURL];
    
    [self presentMoviePlayerViewControllerAnimated:_streamPlayerr];

}

- (void)playbackDidFinish:(NSNotification *)notification{
    if([self.tableView indexPathForSelectedRow] == nil)
        [self downloadData];
    else
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
    return [arr count];
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
    CellData * temp = [arr objectAtIndex:indexPath.row];
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://nextep.ge/beta/xfactor/images/v%@.jpg", temp.imageId]]];
    UIImage * image = [UIImage imageWithData:data];
    [cell.image setImage:image];
    [cell.title setText:temp.name];
    [cell.date setText:temp.date];
    cell.url = temp.url;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loader stopAnimating];
        [self.loader setHidden:YES];
    });

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *streamURL = [NSURL URLWithString:((CellData *)[arr objectAtIndex:indexPath.row]).url];
    _streamPlayerr = [[MPMoviePlayerViewController alloc] initWithContentURL:streamURL];
    
    [self presentMoviePlayerViewControllerAnimated:_streamPlayerr];

    
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
