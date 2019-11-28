//
//  Music.m
//  GuiltyGameProject
//
//  Created by Victor Dângelo Teixeira Ciccarini on 28/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "Music.h"

@implementation NSObject (Music)

-(void)setPlayer: (AVAudioPlayer *)player{
    self.player = player;
}

+(AVAudioPlayer *)getPlayer{
    return self.player;
}

@end
