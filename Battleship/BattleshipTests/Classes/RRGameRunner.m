//
//  RRGameRunner.m
//  BattleshipTests
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//


#import "RRGameRunner.h"

@interface RRGameRunner ()

@end

@implementation RRGameRunner

+ (instancetype)runnerWithGame:(RRGame *)game;
{
  RRGameRunner *runner = [[RRGameRunner alloc] init];
  runner.game = game;
  
  return runner;
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
  NSAssert(YES, @"shouldBePlayer1Turn");
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
