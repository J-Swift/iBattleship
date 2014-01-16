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

@interface RRGame : NSObject

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2;

@end
