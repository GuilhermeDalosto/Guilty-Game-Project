//
//  NSObject+Movement.h
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movement : NSObject

    +(SKAction *_Nonnull) movementeTeam1: (SKSpriteNode *)node;
    +(SKAction *_Nonnull) movementeTeam2: (SKSpriteNode *)node;

@end

NS_ASSUME_NONNULL_END
