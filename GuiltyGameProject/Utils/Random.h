//
//  Random.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Event.h"
#import "Team.h"
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Random)
    
    +(NSString *_Nonnull) decideWord: (NSMutableArray<NSString *>*)vet joiningArgument2: (Deck*) deck;

    +(Event *_Nonnull) decideEvent: (NSMutableArray<Event *>*)vector;

    +(Person *_Nonnull) decideOrder: (Team *)team;

    +(Person *_Nonnull) decidePersonLucky: (Team *)team;

@end

NS_ASSUME_NONNULL_END
