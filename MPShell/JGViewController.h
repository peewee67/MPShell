//
//  JGViewController.h
//  MPShell
//
//  Created by Jeff Gamon on 10/06/2013.
//  Copyright (c) 2013 Jeff Gamon. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "gamekit/gamekit.h"


#define MPShell_Msg_PlayerAuthenticated @"MSG_PlayerAuthenticated"


@interface JGViewController : UIViewController <GKGameCenterControllerDelegate>


// authenticed player is the local player (ie. ME) that has been logged into game center
@property (nonatomic)     GKLocalPlayer *authenticatedPlayer;



- (void) authenticateLocalPlayer;


@end
