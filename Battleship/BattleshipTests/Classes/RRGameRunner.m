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
  NSAssert(self.game.isOver, @"shouldBeOver");
}

- (void)fireAtPoint:(RRPoint *)point
{
  [self.game fireAtPoint:point];
}

- (void)shouldBePlayer1Turn
{
  NSAssert([self.game.currentPlayer isEqual:self.game.player1], @"shouldBePlayer1Turn");
}

- (void)shouldBePlayer2Turn
{
  NSAssert([self.game.currentPlayer isEqual:self.game.player2], @"shouldBePlayer2Turn");
}

- (void)missesByPlayer1:(NSSet *)misses
{
  NSAssert([self.game.player2.misses isEqual:misses], @"missesByPlayer1");
}

- (void)missesByPlayer2:(NSSet *)misses
{
  NSAssert([self.game.player1.misses isEqual:misses], @"missesByPlayer2");
}

- (void)hitsByPlayer1:(NSSet *)hits
{
  NSAssert([self.game.player2.hits isEqual:hits], @"hitsByPlayer1");
}

- (void)hitsByPlayer2:(NSSet *)hits
{
  NSAssert([self.game.player1.hits isEqual:hits], @"hitsByPlayer2");
}

- (void)shipsSunkByPlayer1:(NSSet *)sunk
{
  NSSet *ships = [self setOfShipsFromPositionings:self.game.player2.shipsSunk];
  
  NSAssert([ships isEqual:sunk], @"shipsSunkByPlayer1");
}

- (void)shipsSunkByPlayer2:(NSSet *)sunk
{
  NSSet *ships = [self setOfShipsFromPositionings:self.game.player1.shipsSunk];
  
  NSAssert([ships isEqual:sunk], @"shipsSunkByPlayer2");
}

- (void)shipsRemainingForPlayer1:(NSSet *)remaining
{
  NSSet *ships = [self setOfShipsFromPositionings:self.game.player1.shipsRemaining];
  
  NSAssert([ships isEqual:remaining], @"shipsRemainingForPlayer1");
}

- (void)shipsRemainingForPlayer2:(NSSet *)remaining
{
  NSSet *ships = [self setOfShipsFromPositionings:self.game.player2.shipsRemaining];
  
  NSAssert([ships isEqual:remaining], @"shipsRemainingForPlayer2");
}

#pragma mark - Helpers

- (NSSet *)setOfShipsFromPositionings:(NSSet *)positionings
{
  NSMutableSet *ships = [NSMutableSet setWithCapacity:[positionings count]];
  [positionings enumerateObjectsUsingBlock:^(RRShipPositioning *pos, BOOL *stop) {
    [ships addObject:pos.ship];
  }];
  
  return ships;
}

@end
