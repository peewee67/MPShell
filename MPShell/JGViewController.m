//
//  JGViewController.m
//  MPShell
//
//  Created by Jeff Gamon on 10/06/2013.
//  Copyright (c) 2013 Jeff Gamon. All rights reserved.
//

#import "JGViewController.h"


@interface JGViewController ()

@end

@implementation JGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self authenticateLocalPlayer];

    
    
    [self showGameCenter];
    
}

#pragma tag <GKGameCenterControllerDelegate> delegate and gamecenter related methods
-(void) showAuthenticationDialogWhenReasonable:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:NULL];
}

- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];           // create an instance of local player class
    // setting the authenticateHandler starts the authentification process
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil)
        {// hanlde the asking of the player to log in
            [self showAuthenticationDialogWhenReasonable: viewController];
        }
        else if (localPlayer.isAuthenticated)
        {// store the authenticated player
            self.authenticatedPlayer=localPlayer;
        }
        else
        {// disable multi player
            self.authenticatedPlayer=nil;
        }
        };
}


- (void) showGameCenter
{
    GKGameCenterViewController *gameCenterController = [[GKGameCenterViewController alloc] init];
    if (gameCenterController != nil)
    {
        gameCenterController.gameCenterDelegate = self;
        [self presentViewController: gameCenterController animated: YES completion:nil];
    }
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
