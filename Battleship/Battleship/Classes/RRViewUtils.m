//
//  RRViewUtils.m
//  Battleship
//
//  Created by James Reichley on 1/22/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRViewUtils.h"

@implementation RRViewUtils

+ (CGPoint)originForSize:(CGSize)size toCenterOn:(CGPoint)targetCenter
{
  return CGPointMake(targetCenter.x - size.width/2.0f,
                     targetCenter.y - size.height/2.0f);
}

@end
