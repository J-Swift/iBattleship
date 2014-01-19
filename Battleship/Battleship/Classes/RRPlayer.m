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

- (BOOL)positionShip:(RRShipPositioning *)positioning
{
  if ( ![self canAddPosition:positioning] )
    return NO;
  
  [self.positioningsStore addObject:positioning];
  [self.remainingStore addObject:positioning];
  
  return YES;
}

- (NSSet *)hits
{
  return [self.hitsStore copy];
}

- (NSSet *)misses
{
  return [self.missesStore copy];
}

- (NSSet *)positionedShips
{
  return [self.positioningsStore copy];
}

- (NSSet *)shipsRemaining
{
  return [self.remainingStore copy];
}

- (NSSet *)shipsSunk
{
  return [self.sunkStore copy];
}

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

#pragma mark - Helpers
- (BOOL)canAddPosition:(RRShipPositioning *)pos
{
  NSSet *points = [pos pointsContained];
  for (RRShipPositioning *ship in [self positionedShips])
    if ( [points intersectsSet:[ship pointsContained]] )
        return NO;
        
  return YES;
}

@end
