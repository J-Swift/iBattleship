//
//  RRGameTests.m
//  BattleshipTests
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//

@import XCTest;

#import "RRGame.h"
#import "RRGameRunner.h"

@interface RRGameTests : XCTestCase

@end

@implementation RRGameTests

- (void)testGameIntegrationTest
{
  RRPlayer *player1 = [RRPlayer new];
  RRPlayer *player2 = [RRPlayer new];
  
  RRShipPositioning *p1_destroyer = [RRShipPositioning positioningWithShip:[RRShip destroyer]
                                                                     point:RRPointMake('B', 1)
                                                                 direction:RRDirectionDown];
  RRShipPositioning *p1_cruiser = [RRShipPositioning positioningWithShip:[RRShip cruiser]
                                                                   point:RRPointMake('E', 7)
                                                               direction:RRDirectionRight];
  
  RRShipPositioning *p2_destroyer = [RRShipPositioning positioningWithShip:[RRShip destroyer]
                                                                     point:RRPointMake('J', 5)
                                                                 direction:RRDirectionRight];
  RRShipPositioning *p2_battleship = [RRShipPositioning positioningWithShip:[RRShip battleship]
                                                                      point:RRPointMake('J', 1)
                                                                  direction:RRDirectionRight];
  
  [player1 positionShip:p1_destroyer];
  [player1 positionShip:p1_cruiser];
  
  [player2 positionShip:p2_destroyer];
  [player2 positionShip:p2_battleship];
  
  NSMutableSet *player1Hits = [NSMutableSet set];
  NSMutableSet *player1Misses = [NSMutableSet set];
  NSMutableSet *player2Hits = [NSMutableSet set];
  NSMutableSet *player2Misses = [NSMutableSet set];
  RRPoint *point;
  
  RRGame *battleshipGame = [[RRGame alloc] initWithPlayer1:player1
                                                   player2:player2];
  RRGameRunner *game = [RRGameRunner runnerWithGame:battleshipGame];
  
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
