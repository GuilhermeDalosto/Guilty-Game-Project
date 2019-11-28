//
//  NSObject+Hammer.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

@property NSString* name;
@property NSMutableArray* cards;
@property NSMutableArray* hardCards;


- (instancetype)init: (NSString*) name cards: (NSMutableArray*) cards hardCards: (NSMutableArray*) hardCards;



@end

NS_ASSUME_NONNULL_END
