//
//  RRGame.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RRPlayer.h"
#import "RRShip.h"
#import "RRPoint.h"
#import "RRDirection.h"
#import "RRShipPositioning.h"

// JPR TODO: inject the win condition

@interface RRGame : NSObject

@property (nonatomic, readonly) RRPlayer *player1;
@property (nonatomic, readonly) RRPlayer *player2;

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2;

- (RRPlayer *)currentPlayer;
- (void)fireAtPoint:(RRPoint *)point;

- (BOOL)isOver;

@end
