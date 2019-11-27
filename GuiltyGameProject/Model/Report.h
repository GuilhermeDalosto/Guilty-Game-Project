//
//  NSObject+Report.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Report : NSObject


@property NSMutableDictionary* allRounds;

- (instancetype) init;
- (void) showReport;
- (void) addTurn;

@end

NS_ASSUME_NONNULL_END
