//
//  NSObject+Music.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Sound.h"


@implementation Sound



- (AVAudioPlayer *) playSound : (NSString*) soundName type: (NSString*) soundType repeat: (NSInteger) repeat
{
    
    NSString *url = [[NSBundle mainBundle]pathForResource:soundName ofType:soundType];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:url] error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _audioPlayer.delegate = self;
//    if (repeat >= 1) {
    _audioPlayer.numberOfLoops = repeat;
//    }
    [_audioPlayer play];
//    [_audioPlayer stop];
    return _audioPlayer;
    
    
    
}

- (void) changeSound : (AVAudioPlayer*) audioPlayer{
    [audioPlayer stop];
}


@end
