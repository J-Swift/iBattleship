//
//  RRGameRunner.h
//  BattleshipTests
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

@import Foundation;

#import "RRGame.h"

@interface RRGameRunner : NSObject

@property (nonatomic, strong) RRGame *game;

+ (instancetype)runnerWithGame:(RRGame *)game;

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
