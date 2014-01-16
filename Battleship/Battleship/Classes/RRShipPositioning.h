//
//  RRShipPositioning.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RRShip;
@class RRPoint;
#import "RRDirection.h"

@interface RRShipPositioning : NSObject

@property (nonatomic, readonly) RRShip *ship;
@property (nonatomic, readonly) RRPoint *point;
@property (nonatomic, readonly) RRDirection direction;

+ (instancetype)positioningWithShip:(RRShip *)ship
                              point:(RRPoint *)point
                          direction:(RRDirection)direction;

- (BOOL)containsPoint:(RRPoint *)point;
- (NSSet *)pointsContained;

@end
