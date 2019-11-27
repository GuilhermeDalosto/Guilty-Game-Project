//
//  NSObject+Skin.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Skin : NSObject

@property SKSpriteNode* model;

- (instancetype) init : (SKSpriteNode*) model;

@end

NS_ASSUME_NONNULL_END
