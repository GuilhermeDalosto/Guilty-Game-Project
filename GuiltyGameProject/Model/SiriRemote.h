//
//  NSObject+SiriRemote.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SiriRemote : NSObject

@property (weak) id delegate;
@property (assign) UIView *container;

- (instancetype) init : (UIView*) view;

- (void) startRecognizing : (UIView*) view;

@end

NS_ASSUME_NONNULL_END
