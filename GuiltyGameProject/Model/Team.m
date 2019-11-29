//
//  NSObject+Team.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Team.h"


@implementation Team
 


- (instancetype)init : (NSInteger) numberPerson
{
    self = [super init];
    if (self) {
        self.numberPerson = numberPerson;
        self.lifes = 3;
        Team.turn = false;
    }
    return self;
}

- (void) addPlayer : (Person*) person
{
    
    
}

- (void) toggleTurn
{
    Team.turn = !Team.turn;
    
}

@end
