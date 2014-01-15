//
//  RRBattleshipGameRunner.h
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

@interface RRBattleshipGameRunner : NSObject

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2;

- (void)shouldBeOver;

- (void)fireAtPoint:(RRPoint *)point;

- (void)shouldBePlayer1Turn;
- (void)shouldBePlayer2Turn;

- (void)missesByPlayer1:(NSSet *)misses;
- (void)missesByPlayer2:(NSSet *)misses;

- (void)hitsByPlayer1:(NSSet *)hits;
- (void)hitsByPlayer2:(NSSet *)hits;

- (void)shipsSunkByPlayer1:(NSSet *)ships;
- (void)shipsSunkByPlayer2:(NSSet *)ships;

- (void)shipsRemainingForPlayer1:(NSSet *)ships;
- (void)shipsRemainingForPlayer2:(NSSet *)ships;

@end
