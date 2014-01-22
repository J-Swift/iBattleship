//
//  RRAppDelegate.m
//  Battleship
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//

#import "RRAppDelegate.h"
#import "RRViewController.h"

@implementation RRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [RRViewController new];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
