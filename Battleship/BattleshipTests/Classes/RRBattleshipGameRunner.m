//
//  RRBattleshipGameRunner.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <XCTest/XCTestAssertions.h>

#import "RRBattleshipGameRunner.h"

@interface RRBattleshipGameRunner()

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
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)fireAtPoint:(RRPoint *)point
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shouldBePlayer1Turn
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shouldBePlayer2Turn
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)missesByPlayer1:(NSSet *)misses
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)missesByPlayer2:(NSSet *)misses
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)hitsByPlayer1:(NSSet *)hits
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)hitsByPlayer2:(NSSet *)hits
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shipsSunkByPlayer1:(NSSet *)ships
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shipsSunkByPlayer2:(NSSet *)ships
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shipsRemainingForPlayer1:(NSSet *)ships
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

- (void)shipsRemainingForPlayer2:(NSSet *)ships
{
  NSAssert(NO, @"NOT IMPLEMENTED");
}

@end
