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
@property NSMutableArray<NSString*>* gone;


- (instancetype)init: (NSString*) name cards: (NSMutableArray*) cards hardCards: (NSMutableArray*) hardCards;

+ (void)setGonee: (int) value gone: (NSMutableArray<NSString*>*) gone;



@end

NS_ASSUME_NONNULL_END
