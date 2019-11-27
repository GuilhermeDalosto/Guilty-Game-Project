//
//  NSObject+Random.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Random.h"
#import "Judge.h"




@implementation NSObject (Random)
    
    +(Word *_Nonnull)decideWord:(NSMutableArray *)vector{
//        Word *word = [[Word alloc] init];
//        NSArray *vector2 = [NSArray arrayWithObject:word];
        
//        Word* wordA = [wordArray objectAtIndex:0];
        
//        NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@[word, word, word], nil];
        
        
//        Judge *judge = [[Judge alloc]init];
//
//        [judge decide:wordArray];
        
//        [mutableArray removeObjectAtIndex:0];
        
//        for (NSArray *vector3 in vector) {
//            if (vector3 == vector.firstObject) {
//                vector2 = [vector arrayByAddingObject:[[Word alloc] init]];
//                [wordArray addObject: [vector objectAtIndex:n]]
//            }
//        }
        
        NSMutableArray<Word *> *wordArray = [NSMutableArray array];
        int n = 0;
        for (n = 0; n<vector.count; n++) {
            
            Word *word1 = [vector objectAtIndex:n];
            
            
            if (word1.gone == true) {
                [wordArray addObject: [vector objectAtIndex:n]];
            }
        }
        uint32_t rnd = arc4random_uniform([wordArray count]);
        
        return [wordArray objectAtIndex:rnd];
        
    }

    +(Event *_Nonnull) decideEvent: (NSMutableArray *)vector{
        NSMutableArray<Event *> *eventArray = [NSMutableArray array];
        int n = 0;
        for (n = 0; n<vector.count; n++) {
            
            Event *event1 = [vector objectAtIndex:n];
            
            
            if (event1.gone == true) {
                [eventArray addObject: [vector objectAtIndex:n]];
            }
        }
        uint32_t rnd = arc4random_uniform([eventArray count]);
        
        return [eventArray objectAtIndex:rnd];
    }

@end
