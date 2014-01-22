//
//  RRMyScene.m
//  Battleship
//
//  Created by James Reichley on 12/10/13.
//  Copyright (c) 2013 Reichley Inc. All rights reserved.
//

#import "RRMyScene.h"

@implementation RRMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }
    return self;
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event

{
  // no-op
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
