//
//  RRMainMenuScene.m
//  Battleship
//
//  Created by James Reichley on 1/22/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import "RRMainMenuScene.h"
#import "RRGameScene.h"
#import "RRViewUtils.h"

static NSString * const kPlayGameNode = @"playgame";
static NSString * const kQuitGameNode = @"quitgame";

@implementation RRMainMenuScene

- (instancetype)initWithSize:(CGSize)size
{
  if ( self = [super initWithSize:size] )
  {
    self.backgroundColor = [SKColor colorWithWhite:0.7f alpha:0.4f];

    SKLabelNode *playLabel = [self generatePlayLabel];
    SKLabelNode *quitLabel = [self generateQuitLabel];
    
    SKShapeNode *menu = [self generateMenuNodeWithSize:CGSizeMake(400, playLabel.frame.size.height + quitLabel.frame.size.height + 120.0f)];
    menu.position = [RRViewUtils originForSize:menu.frame.size
                                    toCenterOn:CGRectGetMidPoint(self.frame)];
    
    
    playLabel.position = CGPointMake(menu.frame.size.width/2.0f,
                                     menu.frame.size.height - (playLabel.frame.size.height / 2.0f) - 20);
    [menu addChild:playLabel];
    
    
    quitLabel.position = CGPointMake(menu.frame.size.width/2.0f,
                                     quitLabel.frame.size.height/2.0f + 20);
    [menu addChild:quitLabel];
    
    [self addChild:menu];
  }
  
  return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint positionInScene = [[touches anyObject] locationInNode:self];
  SKNode *node = [self nodeAtPoint:positionInScene];
 
  if ( node )
  {
    if ( [node.name isEqualToString:kPlayGameNode] )
    {
      NSLog(@"Play touched");
      [self.delegate menuScene:self didSelectMenuOption:RRMainMenuOptionPlay];
    }
    else if ( [node.name isEqualToString:kQuitGameNode] )
    {
      NSLog(@"Quit touched");
      [self.delegate menuScene:self didSelectMenuOption:RRMainMenuOptionQuit];
    }
  }
}

#pragma mark - Node Generation

- (SKShapeNode *)generateMenuNodeWithSize:(CGSize)size
{
  SKShapeNode *node = [SKShapeNode node];
  
  node.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)].CGPath;
  node.fillColor = [SKColor colorWithRed:0.0f green:0.6f blue:0.0f alpha:0.6f];
  
  return node;
}

- (SKLabelNode *)generatePlayLabel
{
  SKLabelNode *node = [self generateMenuEntryNodeWithText:@"Play Game!"];
  node.name = kPlayGameNode;
  return node;
}

- (SKLabelNode *)generateQuitLabel
{
  SKLabelNode *node = [self generateMenuEntryNodeWithText:@"Quit"];
  node.name = kQuitGameNode;
  return node;
}

#pragma mark - Helpers

- (SKLabelNode *)generateMenuEntryNodeWithText:(NSString *)text
{
  SKLabelNode *node = [SKLabelNode node];
  
  node.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
  node.text = text;
  node.fontSize = 30.0f;
  node.fontColor = [SKColor colorWithRed:0.6f green:0.0f blue:0.0f alpha:1.0f];
  
  return node;
}
  

@end
