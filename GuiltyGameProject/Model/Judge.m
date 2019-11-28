//
//  NSObject+Judge.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Judge.h"

@implementation Judge

- (instancetype)init : (NSArray*) teams
{
    self = [super init];
    if (self) {
        self.teams = teams;
        
    }
    return self;
}

- (void) passTurn
{
    NSLog(@"Judge: pass turn");
}

- (void) agree
{
    NSLog(@"Judge: agree");
}

- (void) deny: (Team *)team
{
    NSLog(@"Judge: deny");
    team.lifes -= 1;
}

- (void) order
{
    NSLog(@"Judge: order");
    
}

- (void) endGame
{
    NSLog(@"Judge: end game");
}

- (void) report
{
    NSLog(@"Judge: report");
}


@end
