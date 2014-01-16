//
//  RRShipPositioning.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRShipPositioning.h"

#import "RRShip.h"
#import "RRPoint.h"

@interface RRShipPositioning ()

@property (nonatomic, readonly) NSSet *pointSpread;

- (instancetype)initWithShip:(RRShip *)ship
                       point:(RRPoint *)point
                   direction:(RRDirection)direction;

@end

@implementation RRShipPositioning

@synthesize pointSpread = _pointSpread;

+ (instancetype)positioningWithShip:(RRShip *)ship point:(RRPoint *)point direction:(RRDirection)direction
{
  return [[[self class] alloc] initWithShip:ship
                                      point:point
                                  direction:direction];
}

- (instancetype)initWithShip:(RRShip *)ship point:(RRPoint *)point direction:(RRDirection)direction
{
  NSParameterAssert(ship);
  NSParameterAssert(point);
  
  if ( self = [super init] )
  {
    _ship = ship;
    _point = point;
    _direction = direction;
  }
  
  return self;
}

- (NSSet *)pointSpread
{
  if ( !_pointSpread )
  {
    NSMutableSet *spread = [NSMutableSet setWithCapacity:self.ship.size];
    
    RRPoint *refPoint = self.point;
    [spread addObject:refPoint];
    
    for (int i = 1; i < self.ship.size; i++) {
      refPoint = [refPoint pointInDirection:self.direction];
      [spread addObject:refPoint];
    }
    
    _pointSpread = [spread copy];
  }
  
  return _pointSpread;
}

- (BOOL)containsPoint:(RRPoint *)point
{
  return [self.pointSpread containsObject:point];
}

- (NSSet *)pointsContained
{
  return [self.pointSpread copy];
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"Positioning: %@ %@", self.ship, self.point];
}

@end
