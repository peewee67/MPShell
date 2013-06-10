//
//  JGAppDelegate.h
//  MPShell
//
//  Created by Jeff Gamon on 10/06/2013.
//  Copyright (c) 2013 Jeff Gamon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGViewController;

@interface JGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JGViewController *viewController;

@end
