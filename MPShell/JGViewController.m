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
    [self beginPlayerAuthentification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
 
}

- (void) beginPlayerAuthentification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(PlayerHasAuthenticated:) name:MPShell_Msg_PlayerAuthenticated object:nil];

    
    if (self.authenticatedPlayer == nil)
    {
        [self authenticateLocalPlayer];
    }    
}

-(void)PlayerHasAuthenticated:(NSNotification *)message
{// notifiaction has been posted that authentification is complete. move onto next stage...
    NSLog(@"Authenticated player is %@ aka %@", self.authenticatedPlayer.displayName, self.authenticatedPlayer.alias);
    [self showGameCenter];

}



-(void) showAuthenticationDialogWhenReasonable:(UIViewController *)viewController
{// this is called if the local player isn't logged into gamecenter.
 //Bring up the gamecenter login
    [self presentViewController:viewController animated:YES completion:NULL];
}

#pragma tag <GKGameCenterControllerDelegate> delegate and gamecenter related methods
- (void) authenticateLocalPlayer
{   // setting the authenticateHandler starts the authentification process    
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];           // create an instance of local player class
     localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        // this code can be called more that once depending on the log in state of the local player

        if (viewController != nil)
        {// handle the asking of the player to log in
            [self showAuthenticationDialogWhenReasonable: viewController];
        }
        else if (localPlayer.isAuthenticated)
        {// store the authenticated player
            self.authenticatedPlayer=localPlayer;
            [[NSNotificationCenter defaultCenter]postNotificationName:MPShell_Msg_PlayerAuthenticated object:self];
        }
        else
        {// check error and disable multi player
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
