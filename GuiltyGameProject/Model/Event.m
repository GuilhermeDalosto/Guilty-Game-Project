//
//  NSObject+Event.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Event.h"

@implementation Event

- (instancetype)init : (NSString*) description difficulty: (NSInteger) difficulty type: (NSString*) type duration: (NSInteger) duration
{
    self = [super init];
    if (self) {
       // _descriptionEvent = description;
        self.descriptionEvent = description;
        
        self.difficulty = difficulty;
        self.type = type;
        self.duration = duration;
      //  self.gone = false;
    }
    return self;
}

- (void)changeGone:(BOOL)gone{
    self.gone = gone;
}

- (BOOL)getGone{
    return self.gone;
}


@end
