//
//  RRMainMenuScene.h
//  Battleship
//
//  Created by James Reichley on 1/22/14.
//  Copyright (c) 2014 Reichley Inc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol RRMainMenuDelegate;

typedef NS_ENUM(NSUInteger, RRMainMenuOption) {
  RRMainMenuOptionQuit = 0,
  RRMainMenuOptionPlay
};

@interface RRMainMenuScene : SKScene

@property (nonatomic, weak) id<RRMainMenuDelegate> delegate;

@end

@protocol RRMainMenuDelegate <NSObject>

- (void)menuScene:(SKScene *)scene didSelectMenuOption:(RRMainMenuOption)option;

@end
