//
//  NSObject+Music.h
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sound : NSObject

@property AVAudioPlayer *audioPlayer;

- (void) playSound : (NSString*) soundName type: (NSString*) soundType;

@end

NS_ASSUME_NONNULL_END
