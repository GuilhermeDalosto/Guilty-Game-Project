//
//  NSObject+SKAction.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Actions : NSObject


- (void) moveXY :(SKSpriteNode*) sprite x: (NSInteger) x y: (NSInteger) y interval: (NSInteger) interval;
- (void) movePOINT : (SKSpriteNode*) sprite point:(CGPoint)point interval: (NSInteger) interval;
- (void) rotate : (SKSpriteNode*) sprite angle:(CGFloat)angle interval: (NSInteger) interval;

@end

NS_ASSUME_NONNULL_END
