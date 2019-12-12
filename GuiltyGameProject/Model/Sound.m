//
//  NSObject+Music.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 06/12/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Sound.h"


@implementation Sound






- (void) playSound : (NSString*) soundName type: (NSString*) soundType
{
    
    NSString *url = [[NSBundle mainBundle]pathForResource:soundName ofType:soundType];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:url] error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _audioPlayer.delegate = self;
    _audioPlayer.numberOfLoops = 1;
    [_audioPlayer play];
    
    
    
}




@end
