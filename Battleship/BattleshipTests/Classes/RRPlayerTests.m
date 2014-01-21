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

@end
