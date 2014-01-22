//
//  RRViewController.m
//  Battleship
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//

#import "RRViewController.h"
#import "RRMainMenuScene.h"
#import "RRGameScene.h"

@interface RRViewController () <RRMainMenuDelegate>

@end

@implementation RRViewController
{
  BOOL _hasInitialized;
}

- (void)loadView
{
  self.view = [[SKView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  
  // http://www.ymc.ch/en/ios-7-sprite-kit-setting-up-correct-scene-dimensions
  if ( !_hasInitialized )
  {
    _hasInitialized = YES;
    
    // Configure the view.
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    RRMainMenuScene *scene = [RRMainMenuScene sceneWithSize:skView.bounds.size];
    scene.delegate = self;
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [skView presentScene:scene];
  }
}

- (void)menuScene:(SKScene *)scene didSelectMenuOption:(RRMainMenuOption)option
{
  switch (option)
  {
    case RRMainMenuOptionPlay:
    {
      RRGameScene *gameScene = [RRGameScene sceneWithSize:self.view.bounds.size];
      
      SKTransition *t = [SKTransition pushWithDirection:SKTransitionDirectionLeft duration:0.5f];
      t.pausesIncomingScene = YES;
      
      [(SKView *)self.view presentScene:gameScene transition:t];
      break;
    }
    default:
    case RRMainMenuOptionQuit:
      exit(0);
  }
}


@end
