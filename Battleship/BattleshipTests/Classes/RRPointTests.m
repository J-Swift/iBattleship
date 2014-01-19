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
// RRPointTests.m
// Battleship
//
// Created by James Reichley on 1/18/14.
//


#import <XCTest/XCTest.h>

#import "RRPoint.h"

@interface RRPointTests : XCTestCase

@end

@implementation RRPointTests

- (void)testCanCreateFromA1toJ10
{
  for (NSInteger i = 0; i < 10; i++) {
    for (NSInteger j = 0; j < 10; j++) {
      unichar letter = 'A' + i;
      NSUInteger number = 1 + j;
      XCTAssertNotNil(RRPointMake(letter, number),
                      @"%@%@", [NSString stringWithCharacters:&letter length:1], @(number));
    }
  }
}

- (void)testCantCreateInvalidPoints
{
  unichar letter = 'A' - 1;
  XCTAssertThrows(RRPointMake(letter, 1),
                  @"A - 1");
  
  letter = 'J' + 1;
  XCTAssertThrows(RRPointMake(letter, 1),
                  @"J + 1");
  
  XCTAssertThrows(RRPointMake('A', 0),
                  @"zero");
  XCTAssertThrows(RRPointMake('A', 11),
                  @"eleven");
}

- (void)testPointsAreEqualIfTheirParametersAreEqual
{
  XCTAssertEqualObjects(RRPointMake('A', 1), RRPointMake('A', 1),
                        @"Point object comparison");
}

- (void)testLettersAreNormalizedToUppercase
{
  XCTAssertEqualObjects(RRPointMake('a', 1), RRPointMake('A', 1),
                        @"A1 != a1");
  XCTAssertEqualObjects(RRPointMake('c', 1), RRPointMake('C', 1),
                        @"C1 != c1");
}

- (void)testPointsInValidDirections
{
  RRPoint *point = RRPointMake('C', 5);
  
  XCTAssertEqualObjects([point pointInDirection:RRDirectionUp], RRPointMake('B', 5),
                        @"Up should be B5");
  XCTAssertEqualObjects([point pointInDirection:RRDirectionDown], RRPointMake('D', 5),
                        @"Down should be D5");
  XCTAssertEqualObjects([point pointInDirection:RRDirectionLeft], RRPointMake('C', 4),
                        @"Left should be C4");
  XCTAssertEqualObjects([point pointInDirection:RRDirectionRight], RRPointMake('C', 6),
                        @"Right should be C6");
}

- (void)testCantMakePointsThatWouldBeInvalid
{
  RRPoint *topLeft = RRPointMake('A', 1);
  XCTAssertThrows([topLeft pointInDirection:RRDirectionUp],
                  @"Upward of A1");
  XCTAssertThrows([topLeft pointInDirection:RRDirectionLeft],
                  @"Left of A1");
  
  RRPoint *botRight = RRPointMake('J', 10);
  XCTAssertThrows([botRight pointInDirection:RRDirectionDown],
                  @"Downward of J10");
  XCTAssertThrows([botRight pointInDirection:RRDirectionRight],
                  @"Right of J10");
}

@end
