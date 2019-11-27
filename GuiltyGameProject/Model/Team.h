//
//  NSObject+Team.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Team : NSObject

@property NSMutableArray *persons;
@property NSInteger lifes;
@property NSInteger numberPerson;
@property BOOL turn;

- (instancetype)init : (NSArray*) persons _:(NSInteger) lifes _: (NSInteger) numberPerson;
- (void) toggleTurn;

@end

NS_ASSUME_NONNULL_END
