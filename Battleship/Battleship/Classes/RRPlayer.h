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

// JPR TODO: pass in a Positioning instead
- (void)placeShip:(RRShip *)ship atPoint:(RRPoint *)point facing:(RRDirection)direction;

- (NSSet *)positionedShips;
- (NSSet *)shipsSunk;
- (NSSet *)shipsRemaining;
- (NSSet *)hits;
- (NSSet *)misses;

- (RRShipPositioning *)fireAtPoint:(RRPoint *)point;

@end
