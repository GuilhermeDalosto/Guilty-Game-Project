//
//  NSObject+Judge.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skin.h"
#import "Team.h"


NS_ASSUME_NONNULL_BEGIN

@interface Judge : NSObject

@property NSArray *teams;
@property Skin *skin;

- (instancetype)init : (NSArray*) teams;

- (void) passTurn;
- (void) agree;
- (void) deny: (Team *)team;
- (void) order;
- (void) endGame;
- (void) report;

@end

NS_ASSUME_NONNULL_END
