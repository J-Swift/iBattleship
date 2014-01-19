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
// RRShipTests.m
// Battleship
//
// Created by James Reichley on 1/18/14.
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
