//
//  NSObject+Person.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init: (NSString*) cor
{
    self = [super init];
    if (self) {
        self.cor = cor;
    }
    return self;
}

@end
