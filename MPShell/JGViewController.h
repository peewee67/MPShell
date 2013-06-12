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


@property (nonatomic)     GKLocalPlayer *authenticatedPlayer;

@end
