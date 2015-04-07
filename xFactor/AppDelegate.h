//
//  AppDelegate.h
//  xFactor
//
//  Created by NextepMac on 3/30/15.
//  Copyright (c) 2015 NextepMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void(^)(NSData *data))completionHandler;


@end

