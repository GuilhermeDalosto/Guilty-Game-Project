//
//  NSObject+Report.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Report.h"

@implementation Report


- (instancetype) init
{
    self = [super init];
    if (self) {
        self.allRounds = [[NSMutableDictionary alloc]init];
    }
    return self;
    
}



- (void) showReport
{
    
    NSLog(@"%@ - %@", self.allRounds.allKeys,self.allRounds.allValues);
    // Show by order inputed
}

- (void) addTurn : (NSString*) word color:  (NSString*) color
{
    [self.allRounds setObject:word forKey:color];
    
}




@end
