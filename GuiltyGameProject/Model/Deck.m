//
//  NSObject+Person.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (instancetype)init: (NSString*) name cards: (NSMutableArray*) cards hardCards: (NSMutableArray*) hardCards
{
    self = [super init];
    if (self) {
        self.name = name;
        self.cards = cards;
        self.hardCards = cards;
        for(int n = 0; n<cards.count;n++)
            self.gone[n] = @"nop";
    }
    return self;
}

+ (void)setGonee: (int) value gone: (NSMutableArray<NSString*>*) gone{
    gone[value] = @"yep";
}

@end
