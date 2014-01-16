//
//  RRShip.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRShip.h"

// Have to declare the category extension first to use in the private subclasses
@interface RRShip()
- (instancetype)initWithSize:(NSUInteger)size;
@end

#pragma mark - RRShipDestroyer

@interface RRShipDestroyer : RRShip
@end

@implementation RRShipDestroyer

- (instancetype)init
{
  return [super initWithSize:2];
}

@end

#pragma mark - RRShipCruiser

@interface RRShipCruiser : RRShip
@end

@implementation RRShipCruiser

- (instancetype)init
{
  return [super initWithSize:3];
}

@end

#pragma mark - RRShipBattleship

@interface RRShipBattleship : RRShip
@end

@implementation RRShipBattleship

- (instancetype)init
{
  return [super initWithSize:4];
}

@end

#pragma mark - RRShip

@implementation RRShip

+ (instancetype)destroyer
{
  static dispatch_once_t onceToken;
  static RRShip *destroyerSingleton = nil;
  
  dispatch_once( &onceToken, ^{
    destroyerSingleton = [RRShipDestroyer new];
  } );
  
  return destroyerSingleton;
}

+ (instancetype)cruiser
{
  static dispatch_once_t onceToken;
  static RRShip *cruiserSingleton = nil;
  
  dispatch_once( &onceToken, ^{
    cruiserSingleton = [RRShipCruiser new];
  } );
  
  return cruiserSingleton;
}

+ (instancetype)battleship
{
  static dispatch_once_t onceToken;
  static RRShip *battleshipSingleton = nil;
  
  dispatch_once( &onceToken, ^{
    battleshipSingleton = [RRShipBattleship new];
  } );
  
  return battleshipSingleton;
}

- (instancetype)initWithSize:(NSUInteger)size
{
  if ( self = [super init] )
    _size = size;
  
  return self;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"Ship: %@", [[self class] description]];
}

@end
