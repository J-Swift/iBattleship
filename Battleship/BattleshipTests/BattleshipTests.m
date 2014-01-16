//
//  BattleshipTests.m
//  BattleshipTests
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//

@import XCTest;

#import "RRBattleshipGameRunner.h"

@interface BattleshipTests : XCTestCase

@end

@implementation BattleshipTests

- (void)testGameIntegrationTest
{
  RRPlayer *player1 = [RRPlayer new];
  [player1 placeShip:[RRShip destroyer]
             atPoint:RRPointMake('B', 1)
              facing:RRDirectionDown];
  [player1 placeShip:[RRShip cruiser]
             atPoint:RRPointMake('E', 7)
              facing:RRDirectionRight];
  
  RRPlayer *player2 = [RRPlayer new];
  [player2 placeShip:[RRShip destroyer]
             atPoint:RRPointMake('J', 5)
              facing:RRDirectionRight];
  [player2 placeShip:[RRShip battleship]
             atPoint:RRPointMake('J', 1)
              facing:RRDirectionRight];
  
  NSMutableSet *player1Hits = [NSMutableSet set];
  NSMutableSet *player1Misses = [NSMutableSet set];
  NSMutableSet *player2Hits = [NSMutableSet set];
  NSMutableSet *player2Misses = [NSMutableSet set];
  RRPoint *point;
  
  RRBattleshipGameRunner *game = [[RRBattleshipGameRunner alloc] initWithPlayer1:player1
                                                                         player2:player2];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('J', 5);
  [player1Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet set]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship], [RRShip destroyer]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('D', 1);
  [player2Misses addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet set]];
  [game shipsRemainingForPlayer1:[NSSet setWithArray:@[[RRShip cruiser], [RRShip destroyer]]]];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('J', 6);
  [player1Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('C', 1);
  [player2Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet set]];
  [game shipsRemainingForPlayer1:[NSSet setWithArray:@[[RRShip cruiser], [RRShip destroyer]]]];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('F', 2);
  [player1Misses addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('B', 1);
  [player2Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer1:[NSSet setWithArray:@[[RRShip cruiser]]]];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('A', 1);
  [player1Misses addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('E', 7);
  [player2Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer1:[NSSet setWithArray:@[[RRShip cruiser]]]];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('J', 1);
  [player1Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('E', 8);
  [player2Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer1:[NSSet setWithArray:@[[RRShip cruiser]]]];
  
  [game shouldBePlayer1Turn];
  
  point = RRPointMake('J', 2);
  [player1Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer1:player1Misses];
  [game hitsByPlayer1:player1Hits];
  [game shipsSunkByPlayer1:[NSSet setWithArray:@[[RRShip destroyer]]]];
  [game shipsRemainingForPlayer2:[NSSet setWithArray:@[[RRShip battleship]]]];
  
  [game shouldBePlayer2Turn];
  
  point = RRPointMake('E', 9);
  [player2Hits addObject:point];
  [game fireAtPoint:point];
  [game missesByPlayer2:player2Misses];
  [game hitsByPlayer2:player2Hits];
  [game shipsSunkByPlayer2:[NSSet setWithArray:@[[RRShip destroyer], [RRShip cruiser]]]];
  [game shipsRemainingForPlayer1:[NSSet set]];
  
  [game shouldBeOver];
}

@end
