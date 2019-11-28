//
//  Movement.m
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Movement.h"

@implementation Movement

    +(SKAction *_Nonnull) movementeTeam1: (SKSpriteNode *)node{
        CGPoint position = [node position];
        SKAction *action = [SKAction sequence:
            @[[SKAction moveTo:CGPointMake(position.x, position.y-30) duration:1.0f],
              [SKAction waitForDuration:1.0f],
              [SKAction moveTo:CGPointMake(position.x-40, position.y) duration:1.0f],
              [SKAction waitForDuration:1.0f],
              [SKAction moveTo:CGPointMake(position.x, position.y+60) duration:1.0f],
              [SKAction waitForDuration:1.0f]]];
        
        return action;
        
    }

    +(SKAction *_Nonnull) movementeTeam2: (SKSpriteNode *)node{
        CGPoint position = [node position];
        SKAction *action = [SKAction sequence:
            @[[SKAction moveTo:CGPointMake(position.x, position.y-30) duration:1.0f],
              [SKAction waitForDuration:1.0f],
              [SKAction moveTo:CGPointMake(position.x+40, position.y) duration:1.0f],
              [SKAction waitForDuration:1.0f],
              [SKAction moveTo:CGPointMake(position.x, position.y+60) duration:1.0f],
              [SKAction waitForDuration:1.0f]]];
        
        return action;
    }

@end
