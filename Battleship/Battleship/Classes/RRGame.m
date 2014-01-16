//
//  RRGame.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRGame.h"

@interface RRGame ()

@property (nonatomic, strong, readwrite) RRPlayer *player1;
@property (nonatomic, strong, readwrite) RRPlayer *player2;

@end

@implementation RRGame

- (instancetype)initWithPlayer1:(RRPlayer *)player1 player2:(RRPlayer *)player2
{
  NSParameterAssert(player1);
  NSParameterAssert(player2);
  
  if ( self = [super init] )
  {
    self.player1 = player1;
    self.player2 = player2;
  }
  
  return self;
}

@end
