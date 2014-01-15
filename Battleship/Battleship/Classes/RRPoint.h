//
//  RRPoint.h
//  Battleship
//
//  Created by James Reichley on 1/15/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRPoint : NSObject

@property (nonatomic, readonly) unichar letter;
@property (nonatomic, readonly) NSUInteger number;

- (instancetype)initWithLetter:(unichar)letter number:(NSUInteger)number;

@end

CG_INLINE RRPoint* RRPointMake(unichar letter, NSUInteger number)
{
  return [[RRPoint alloc] initWithLetter:letter number:number];
}
