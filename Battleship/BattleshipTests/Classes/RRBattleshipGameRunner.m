//
//  RRBattleshipGameRunner.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//


#import "RRBattleshipGameRunner.h"

@interface RRBattleshipGameRunner ()

@property (nonatomic, strong) RRPlayer *player1;
@property (nonatomic, strong) RRPlayer *player2;

@end

@implementation RRBattleshipGameRunner

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2
{
  NSParameterAssert(player1);
  NSParameterAssert(player2);
  
  if ( self = [super init] )
  {
    self.player1 = player1;
    self.player2 = player2;
  }
  
  return self;
}

- (void)shouldBeOver
{
  NSAssert(NO, @"shouldBeOver");
}

- (void)fireAtPoint:(RRPoint *)point
{
  NSAssert(NO, @"fireAtPoint");
}

- (void)shouldBePlayer1Turn
{
  NSAssert(NO, @"shouldBePlayer1Turn");
}

- (void)shouldBePlayer2Turn
{
  NSAssert(NO, @"shouldBePlayer2Turn");
}

- (void)missesByPlayer1:(NSSet *)misses
{
  NSAssert(NO, @"missesByPlayer1");
}

- (void)missesByPlayer2:(NSSet *)misses
{
  NSAssert(NO, @"missesByPlayer2");
}

- (void)hitsByPlayer1:(NSSet *)hits
{
  NSAssert(NO, @"hitsByPlayer1");
}

- (void)hitsByPlayer2:(NSSet *)hits
{
  NSAssert(NO, @"hitsByPlayer2");
}

- (void)shipsSunkByPlayer1:(NSSet *)ships
{
  NSAssert(NO, @"shipsSunkByPlayer1");
}

- (void)shipsSunkByPlayer2:(NSSet *)ships
{
  NSAssert(NO, @"shipsSunkByPlayer2");
}

- (void)shipsRemainingForPlayer1:(NSSet *)ships
{
  NSAssert(NO, @"shipsRemainingForPlayer1");
}

- (void)shipsRemainingForPlayer2:(NSSet *)ships
{
  NSAssert(NO, @"shipsRemainingForPlayer2");
}

@end
