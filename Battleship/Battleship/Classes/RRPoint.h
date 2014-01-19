//
//  RRPoint.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RRDirection.h"

/*
 * Boards are laid out as follows:
 *
 *   1 2 3 4 5 6 7 8 9 10
 * A
 * B
 * C
 * D
 * E
 * F
 * G
 * H
 * I
 * J
 */

@interface RRPoint : NSObject

@property (nonatomic, readonly) unichar letter;
@property (nonatomic, readonly) NSUInteger number;

- (instancetype)initWithLetter:(unichar)letter number:(NSUInteger)number;

- (instancetype)pointInDirection:(RRDirection)direction;

@end

CG_INLINE RRPoint* RRPointMake(unichar letter, NSUInteger number)
{
  return [[RRPoint alloc] initWithLetter:letter number:number];
}
