//  RRPlayerTests.m
//  BattleshipTests
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//


#import <XCTest/XCTest.h>

#import "RRPlayer.h"

#import "RRShipPositioning.h"
#import "RRShip.h"
#import "RRPoint.h"

@interface RRPlayerTests : XCTestCase

@property (nonatomic, strong) RRPlayer *player;

@end

@implementation RRPlayerTests

- (void)setUp
{
  self.player = [RRPlayer new];
}

- (void)testPositioningShips
{
  XCTAssertEqual([[self.player positionedShips] count], 0U,
                 @"default value");
  
  RRShipPositioning *pos = [RRShipPositioning positioningWithShip:[RRShip destroyer] point:RRPointMake('A', 1) direction:RRDirectionRight];
  XCTAssertTrue([self.player positionShip:pos],
                @"placing ship");
  
  XCTAssertEqual([[self.player positionedShips] count], 1U,
                 @"after placement");
}

- (void)testCantPositionShipsAtopOtherShips
{
  RRShipPositioning *pos1 = [RRShipPositioning positioningWithShip:[RRShip destroyer] point:RRPointMake('A', 1) direction:RRDirectionRight];
  RRShipPositioning *pos2 = [RRShipPositioning positioningWithShip:[RRShip cruiser] point:RRPointMake('A', 2) direction:RRDirectionDown];
  
  XCTAssertTrue([self.player positionShip:pos1],
                @"pos1");
  XCTAssertFalse([self.player positionShip:pos2],
                 @"pos2");
}

- (void)testFireAndMissReturnsNil
{
  XCTAssertEqual([[self.player positionedShips] count], 0U,
                 @"should not have any ships positioned");
  XCTAssertNil([self.player fireAtPoint:RRPointMake('A', 1)],
               @"fireAtPoint should return nil on miss");
}

- (void)testFireAndHitReturnsAppropriateShipPositioning
{
  RRShipPositioning *pos = [RRShipPositioning positioningWithShip:[RRShip destroyer] point:RRPointMake('A', 1) direction:RRDirectionRight];
  [self.player positionShip:pos];
  
  XCTAssertEqual([self.player fireAtPoint:RRPointMake('A', 1)], pos,
                 @"fireAtPoint should return ShipPositioning on hit");
}

- (void)testPlayersAutomaticallySinkTheirOwnShips
{
  RRShipPositioning *pos = [RRShipPositioning positioningWithShip:[RRShip destroyer] point:RRPointMake('A', 1) direction:RRDirectionRight];
  [self.player positionShip:pos];
  
  for (RRPoint *point in [pos pointsContained])
  {
    XCTAssertEqualObjects([self.player shipsRemaining], [NSSet setWithArray:@[pos]],
                          @"shipsRemaining");
    XCTAssertEqualObjects([self.player shipsSunk], [NSSet set],
                          @"shipsSunk");
    [self.player fireAtPoint:point];
  }
  
  XCTAssertEqualObjects([self.player shipsRemaining], [NSSet set],
                        @"remaining should be empty");
  XCTAssertEqualObjects([self.player shipsSunk], [NSSet setWithArray:@[pos]],
                        @"sunk should have ship that has been sunk");
}

@end
