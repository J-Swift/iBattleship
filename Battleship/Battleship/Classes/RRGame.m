//
//  RRGame.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRGame.h"

@interface RRGame ()

@property (nonatomic, strong) RRPlayer *currentPlayer;
@property (nonatomic, strong) RRPlayer *otherPlayer;

@end

@implementation RRGame

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2
{
  NSParameterAssert(player1);
  NSParameterAssert(player2);
  
  if ( self = [super init] )
  {
    _player1 = player1;
    _player2 = player2;
    
    _currentPlayer = player1;
    _otherPlayer = player2;
  }
  
  return self;
}

- (RRPlayer *)currentPlayer
{
  return _currentPlayer;
}

- (void)fireAtPoint:(RRPoint *)point
{
  [_otherPlayer fireAtPoint:point];
  
  [self finishTurn];
}

- (BOOL)isOver
{
  return !([[self.player1 shipsRemaining] count] && [[self.player2 shipsRemaining] count]);
}

#pragma mark - Helpers

- (void)finishTurn
{
  // Swap the current/other player
  RRPlayer *player = _currentPlayer;
  _currentPlayer = _otherPlayer;
  _otherPlayer = player;
}

@end
