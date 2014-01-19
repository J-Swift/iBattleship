//
//  RRPlayer.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RRDirection.h"
@class RRShip;
@class RRPoint;
@class RRShipPositioning;

@interface RRPlayer : NSObject

- (void)positionShip:(RRShipPositioning *)positioning;

- (NSSet *)positionedShips;
- (NSSet *)shipsSunk;
- (NSSet *)shipsRemaining;
- (NSSet *)hits;
- (NSSet *)misses;

- (RRShipPositioning *)fireAtPoint:(RRPoint *)point;

@end
