//
//  NSObject+SKAction.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Actions : NSObject


- (void) moveBy :(SKSpriteNode*) sprite x: (CGFloat*) x y: (CGFloat*) y interval: (CGFloat*) interval;
- (void) moveTo : (SKSpriteNode*) sprite point:(CGPoint)point interval: (CGFloat*) interval;
- (void) rotate : (SKSpriteNode*) sprite angle:(CGFloat)angle interval: (CGFloat*) interval;

@end

NS_ASSUME_NONNULL_END
