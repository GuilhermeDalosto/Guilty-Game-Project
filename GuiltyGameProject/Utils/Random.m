//
//  NSObject+Random.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Random.h"
#import "Word.h"
#import "Event.h"
#import "Judge.h"




@implementation NSObject (Random)
    
    - (void)decide:(NSMutableArray *)vector{
        Word *word = [[Word alloc] init];
//        NSArray *vector2 = [NSArray arrayWithObject:word];
        
        NSMutableArray<Word *> *wordArray = [NSMutableArray array];
        
//        Word* wordA = [wordArray objectAtIndex:0];
        
//        NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@[word, word, word], nil];
        
        
//        Judge *judge = [[Judge alloc]init];
//
//        [judge decide:wordArray];
        
//        [mutableArray removeObjectAtIndex:0];
        
        
        for (int n = 0; n<vector.count; n++) {
            
            Word *word1 = [vector objectAtIndex:n];
            
            
            if (word1.gone == true) {
                [wordArray addObject: [vector objectAtIndex:n]];
            }
        }
        
//        for (NSArray *vector3 in vector) {
//            if (vector3 == vector.firstObject) {
//                vector2 = [vector arrayByAddingObject:[[Word alloc] init]];
//                [wordArray addObject: [vector objectAtIndex:n]]
//            }
//        }
        
        
        
        
    }

@end
