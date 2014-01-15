//
//  RRPlayer.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RRShip.h"
#import "RRPoint.h"
#import "RRDirection.h"

@interface RRPlayer : NSObject

- (void)placeShip:(RRShip *)ship atPoint:(RRPoint *)point facing:(RRDirection)direction;

@end
