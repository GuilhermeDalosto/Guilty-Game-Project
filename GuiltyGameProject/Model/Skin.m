//
//  NSObject+Skin.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Skin.h"

@implementation Skin


- (instancetype) init : (SKSpriteNode*) model
{
    self = [super init];
    if (self) {
        self.model = model;
        
    }
    return self;
}


@end
