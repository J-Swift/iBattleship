//
//  RRPoint.m
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRPoint.h"

@implementation RRPoint

- (instancetype)initWithLetter:(unichar)letter number:(NSUInteger)number
{
  NSParameterAssert(('A' <= letter && letter <= 'J') ||
                    ('a' <= letter && letter <= 'j'));
  NSParameterAssert(1 <= number && number <= 10);
  
  if ( self = [super init] )
  {
    // normalize to uppercase
    _letter = [[[NSString stringWithCharacters:&letter length:1] uppercaseString] characterAtIndex:0];
    _number = number;
  }
  
  return self;
}

/**
 * @return A point which is 1-space away in the given direction
 */
- (instancetype)pointInDirection:(RRDirection)direction
{
  unichar nextLetter = self.letter;
  NSUInteger nextNumber = self.number;
  
  switch (direction) {
    case RRDirectionUp:
      nextLetter -= 1;
      break;
    case RRDirectionDown:
      nextLetter += 1;
      break;
    case RRDirectionLeft:
      nextNumber -= 1;
      break;
    case RRDirectionRight:
      nextNumber += 1;
      break;
  }
  
  return RRPointMake(nextLetter, nextNumber);
}

#pragma mark - Overrides

- (BOOL)isEqualToPoint:(RRPoint *)other
{
  if ( !other )
    return NO;
  
  return ( other.letter == self.letter && other.number == self.number );
}

- (BOOL)isEqual:(id)object
{
  if ( object == self )
    return YES;
  
  if ( ![object isKindOfClass:[RRPoint class]] )
    return NO;
  
  return [self isEqualToPoint:object];
}

- (NSUInteger)hash
{
  return self.letter ^ self.number;
}

- (NSString *)description
{
  return [NSString stringWithFormat:@"Point: %@%lu", [NSString stringWithCharacters:&_letter length:1], (unsigned long)self.number];
}

@end
