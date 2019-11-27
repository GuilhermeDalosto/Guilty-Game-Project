//
//  NSObject+Random.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Word.h"
#import "Event.h"
#import "Team.h"
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Random)
    
    +(Word *_Nonnull) decideWord: (NSMutableArray<Word *>*)vector;

    +(Event *_Nonnull) decideEvent: (NSMutableArray<Event *>*)vector;

    +(Person *_Nonnull) decideOrder: (Team *)team;

    +(Person *_Nonnull) decidePersonLucky: (Team *)team;

@end

NS_ASSUME_NONNULL_END
