//
//  RRViewUtils.h
//  Battleship
//
//  Created by James Reichley on 1/22/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRViewUtils : NSObject

+ (CGPoint)originForSize:(CGSize)size toCenterOn:(CGPoint)targetCenter;

@end

CG_INLINE CGPoint CGRectGetMidPoint( CGRect rect )
{
  return CGPointMake(CGRectGetMidX(rect),
                     CGRectGetMidY(rect));
}
