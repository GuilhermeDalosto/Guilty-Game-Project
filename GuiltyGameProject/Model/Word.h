//
//  NSObject+Word.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 26/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Word : NSObject

@property NSString *title;
@property NSInteger difficulty;
@property NSString *deck;
@property BOOL gone;

- (instancetype) init : (NSString*) title difficulty: (NSInteger) difficulty deck: (NSString*) deck;

@end

NS_ASSUME_NONNULL_END
