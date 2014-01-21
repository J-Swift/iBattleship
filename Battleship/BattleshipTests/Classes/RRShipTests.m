//
//  RRShipTests.m
//  BattleshipTests
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//


#import <XCTest/XCTest.h>

#import "RRShip.h"

@interface RRShipTests : XCTestCase

@end

@implementation RRShipTests

- (void)testShipsAreSingletons
{
  XCTAssert([RRShip destroyer] == [RRShip destroyer],
            @"destroyer singleton");
  XCTAssert([RRShip cruiser] == [RRShip cruiser],
            @"cruiser singleton");
  XCTAssert([RRShip submarine] == [RRShip submarine],
            @"submarine singleton");
  XCTAssert([RRShip battleship] == [RRShip battleship],
            @"battleship singleton");
  XCTAssert([RRShip aircraftCarrier] == [RRShip aircraftCarrier],
            @"aircraftCarrier singleton");
}

- (void)testShipSizes
{
  XCTAssert([RRShip destroyer].size == 2U,
            @"destroyer size");
  XCTAssert([RRShip cruiser].size == 3U,
            @"cruiser size");
  XCTAssert([RRShip submarine].size == 3U,
            @"submarine size");
  XCTAssert([RRShip battleship].size == 4U,
            @"battleship size");
  XCTAssert([RRShip aircraftCarrier].size == 5U,
            @"aircraftCarrier size");
}

@end
