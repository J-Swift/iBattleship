//
//  RRPointTests.m
//  BattleshipTests
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
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
