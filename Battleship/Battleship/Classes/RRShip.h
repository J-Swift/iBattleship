//
//  RRShip.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRShip : NSObject

@property (nonatomic, readonly) NSUInteger size;

+ (instancetype)destroyer;
+ (instancetype)cruiser;
+ (instancetype)submarine;
+ (instancetype)battleship;
+ (instancetype)aircraftCarrier;

@end
