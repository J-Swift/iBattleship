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
  NSParameterAssert('A' <= letter && letter <= 'J');
  NSParameterAssert(1 <= number && number <= 10);
  
  if ( self = [super init] )
  {
    _letter = letter;
    _number = number;
  }
  
  return self;
}

@end
