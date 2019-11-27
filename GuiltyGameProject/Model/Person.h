//
//  NSObject+Person.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class Team;

@interface Person : NSObject

@property NSString *color;
@property Team *team;
@property BOOL gone;

- (instancetype)init: (NSString*) color team: (Team*) team;

@end

NS_ASSUME_NONNULL_END
