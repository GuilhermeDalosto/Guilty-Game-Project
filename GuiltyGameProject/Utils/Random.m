//
//  Random.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 25/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Random.h"
#import "Judge.h"




@implementation NSObject (Random)
    
 //   +(Word *_Nonnull)decideWord:(NSMutableArray<Word *>*)vector{
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
//
//        NSMutableArray<Word *> *wordArray = [NSMutableArray array];
//        int n = 0;
//        for (n = 0; n<vector.count; n++) {
//
//            Word *word1 = [vector objectAtIndex:n];
//
//
//            if (word1.gone == false) {
//
//                [wordArray addObject: [vector objectAtIndex:n]];
//                [vector objectAtIndex:n].gone = true;
//            }
//        }
//        uint32_t rnd = arc4random_uniform([wordArray count]);
//
//        return [wordArray objectAtIndex:rnd];
//
 //   }

+(Event *_Nonnull) decideEvent: (NSMutableArray<Event *>*)vector{
        NSMutableArray<Event *> *eventArray = [NSMutableArray array];
        int n = 0;
        //BOOL state = false;
        
        
        
        for (n = 0; n<vector.count; n++) {
            
            Event *event1 = [vector objectAtIndex:n];
            
            
            if ([event1 getGone] == false) {
                [eventArray addObject: [vector objectAtIndex:n]];
                
                [[vector objectAtIndex:n] changeGone:false];

            }
        }
        uint32_t rnd = arc4random_uniform([eventArray count]);
        
        return [eventArray objectAtIndex:rnd];
    }

    +(Person *_Nonnull) decideOrder: (NSMutableArray<Person *>*)team{
        NSMutableArray<Person *> *personArray = [NSMutableArray array];
        int n = 0;
        
        for (n = 0; n<team.count; n++) {
            
            Person *person1 = [team objectAtIndex:n];
            
            
            if (person1.gone == false) {
                [personArray addObject: [team objectAtIndex:n]];
                
                [team objectAtIndex:n].gone = true;

            }
        }
        uint32_t rnd = arc4random_uniform([team count]);
        return [team objectAtIndex:rnd];
    }

    +(Person *_Nonnull) decidePersonLucky: (Team *)team{
        uint32_t rnd = arc4random_uniform([team.persons count]);
        return [team.persons objectAtIndex:rnd];
    }

@end
