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

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)positionedShips;

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)shipsSunk;

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)shipsRemaining;

/**
 * Collection of RRPoints
 */
- (NSSet *)hits;

/**
 * Collection of RRPoints
 */
- (NSSet *)misses;

/**
 * Handles all logic for hits/misses/sinking
 *
 * @return The ShipPositioning that was hit or nil if miss
 */
- (RRShipPositioning *)fireAtPoint:(RRPoint *)point;

@end
