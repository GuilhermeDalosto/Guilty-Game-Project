//
//  Music.h
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Music)

@property AVAudioPlayer *player;

-(void)setPlayer: (AVAudioPlayer *)player;

+(AVAudioPlayer *)getPlayer;

@end

NS_ASSUME_NONNULL_END
