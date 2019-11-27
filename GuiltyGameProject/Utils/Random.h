//
//  NSObject+Random.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Word.h"
#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Random)
    
    +(Word *_Nonnull) decideWord: (NSMutableArray *)vector;

    +(Event *_Nonnull) decideEvent: (NSMutableArray *)vector;

@end

NS_ASSUME_NONNULL_END
