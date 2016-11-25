//
//  RootWindow.m
//  CurrencyConverter
//
//  Created by ENGLISH on 11/17/16.
//  Copyright © 2016 ArtemBerezovskiy. All rights reserved.
//

#import "RootWindow.h"
#import "CurrencyViewController.h"

@implementation RootWindow


- (instancetype)init
{
    self = [super init];
    
    [self createWindow];
    
    return self;
}


- (void) createWindow
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CurrencyViewController *mainVC = [[CurrencyViewController alloc] initWithNibName: nil bundle: nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    navigationController.navigationBar.translucent = NO;
    
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    self.root = window;
}


@end
