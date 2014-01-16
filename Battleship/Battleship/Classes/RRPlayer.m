//
//  RRPlayer.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRPlayer.h"

#import "RRShipPositioning.h"

@interface RRPlayer ()

@property (nonatomic, strong) NSMutableSet *positioningsStore;
@property (nonatomic, strong) NSMutableSet *sunkStore;
@property (nonatomic, strong) NSMutableSet *remainingStore;
@property (nonatomic, strong) NSMutableSet *missesStore;
@property (nonatomic, strong) NSMutableSet *hitsStore;

@end

@implementation RRPlayer

- (instancetype)init
{
  if ( self = [super init] )
  {
    self.positioningsStore = [NSMutableSet new];
    self.sunkStore = [NSMutableSet new];
    self.remainingStore = [NSMutableSet new];
    self.missesStore = [NSMutableSet new];
    self.hitsStore = [NSMutableSet new];
  }
  
  return self;
}

#pragma mark - API

- (void)placeShip:(RRShip *)ship atPoint:(RRPoint *)point facing:(RRDirection)direction
{
  RRShipPositioning *pos = [RRShipPositioning positioningWithShip:ship
                                                            point:point
                                                        direction:direction];
  [self.positioningsStore addObject:pos];
  [self.remainingStore addObject:pos];
}

/**
 * Collection of RRPoints
 */
- (NSSet *)hits
{
  return [self.hitsStore copy];
}

/**
 * Collection of RRPoints
 */
- (NSSet *)misses
{
  return [self.missesStore copy];
}

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)positionedShips
{
  return [self.positioningsStore copy];
}

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)shipsRemaining
{
  return [self.remainingStore copy];
}

/**
 * Collection of RRShipPositionings
 */
- (NSSet *)shipsSunk
{
  return [self.sunkStore copy];
}

/**
 * Handles all logic for hits/misses/sinking
 *
 * @return The ShipPositioning that was hit or nil if miss
 */
- (RRShipPositioning *)fireAtPoint:(RRPoint *)point
{
  RRShipPositioning *hit = nil;
  
  for (RRShipPositioning *pos in [self positionedShips])
  {
    if ( [pos containsPoint:point] )
      hit = pos;
  }

  if (!hit)
    [self.missesStore addObject:point];
  else
  {
    [self.hitsStore addObject:point];
    if ( [[hit pointsContained] isSubsetOfSet:self.hitsStore] )
    {
      [self.remainingStore removeObject:hit];
      [self.sunkStore addObject:hit];
    }
  }
  
  return hit;
}

@end
