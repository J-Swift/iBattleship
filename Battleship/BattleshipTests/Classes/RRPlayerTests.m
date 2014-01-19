//
// This software is supplied by Gloto Corp. ("Gloto"). Any user of this
// software agrees to hold Gloto harmless for any and all damages or
// liabilities that arise out of the use of the software for any purpose.
// Gloto provides this source code "as is" and does not warrant
// suitability for any purpose. Gloto grants the user of the software a
// non-exclusive right to modify and redistribute the source code for any
// purpose.
// 
// Copyright (c) 2014 - Gloto Corp.
//
//
// RRPlayerTests.m
// Battleship
//
// Created by James Reichley on 1/18/14.
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
