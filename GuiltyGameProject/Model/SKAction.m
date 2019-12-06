//
//  NSObject+SKAction.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "SKAction.h"
#import <SpriteKit/SpriteKit.h>

@implementation SKAction





- (void) moveBy :(SKSpriteNode*) sprite x: (CGFloat*) x y: (CGFloat*) y interval: (CGFloat*) interval
{
    SKAction *move = [SKAction moveByX:*x y:*y duration:*interval];
    [sprite runAction:move];
}


- (void) moveTo : (SKSpriteNode*) sprite point:(CGPoint)point interval: (CGFloat*) interval
{
    SKAction *move = [SKAction moveTo:point duration:*interval];
    [sprite runAction:move];
}

//
//- (void) moveTo : (SKSpriteNode*) sprite point:(CGPoint)point interval: (CGFloat*) interval
//{
//    SKAction *move = [SKAction moveTo:point duration:*interval];
//    [sprite runAction:move];
//}



@end
