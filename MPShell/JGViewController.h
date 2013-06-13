//
//  JGViewController.h
//  MPShell
//
//  Created by Jeff Gamon on 10/06/2013.
//  Copyright (c) 2013 Jeff Gamon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "gamekit/gamekit.h"


@interface JGViewController : UIViewController <GKGameCenterControllerDelegate>


// authenticed player is the local player (ie. ME) that has been logged into game center
@property (nonatomic)     GKLocalPlayer *authenticatedPlayer;



- (void) authenticateLocalPlayer;


@end
