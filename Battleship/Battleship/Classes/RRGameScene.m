//
//  RRGameScene.m
//  Battleship
//
//  Created by James Reichley on 1/22/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRGameScene.h"
#import "RRViewUtils.h"

@implementation RRGameScene

- (instancetype)initWithSize:(CGSize)size
{
  if ( self = [super initWithSize:size] )
  {
    self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    
    SKLabelNode *myLabel = [SKLabelNode node];
    myLabel.text = @"Game Scene";
    myLabel.fontSize = 30.0f;
    myLabel.position = CGRectGetMidPoint(self.frame);
    
    [self addChild:myLabel];
  }
  return self;
}

@end
