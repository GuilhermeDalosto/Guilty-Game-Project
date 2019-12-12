//
//  NSObject+Team.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@class Person;

@interface Team : NSObject

@property NSMutableArray *persons;
@property NSInteger lifes;
@property NSInteger numberPerson;
@property (assign) BOOL turn;

- (instancetype)init : (NSInteger) numberPerson;
- (void) addPlayer : (Person*) person;
- (void) toggleTurn;

@end

NS_ASSUME_NONNULL_END
