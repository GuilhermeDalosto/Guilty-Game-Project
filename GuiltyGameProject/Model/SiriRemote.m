//
//  NSObject+SiriRemote.m
//  GuiltyGameProject
//
//  Created by Guilherme Martins Dalosto de Oliveira on 27/11/19.
//  Copyright © 2019 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "SiriRemote.h"
#import <UIKit/UIKit.h>

@implementation SiriRemote

- (instancetype) init : (UIView*) view
{
    self = [super init];
    if (self) {
        [self startRecognizing: view];
    }
    return self;
    
}

- (void) startRecognizing : (UIView*) view
{
    UITapGestureRecognizer *PlayPause = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    PlayPause.allowedPressTypes = @[[NSNumber numberWithInteger:UIPressTypePlayPause]];
    
    UITapGestureRecognizer *Menu = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    Menu.allowedPressTypes = @[[NSNumber numberWithInteger:UIPressTypeMenu]];
    
    UITapGestureRecognizer *Select = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    Select.allowedPressTypes = @[[NSNumber numberWithInteger:UIPressTypeSelect]];
    
    UITapGestureRecognizer *UpArrow = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    UpArrow.allowedPressTypes = @[[NSNumber numberWithInteger:UpArrow]];
    
    UITapGestureRecognizer *LeftArrow = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    LeftArrow.allowedPressTypes = @[[NSNumber numberWithInteger:LeftArrow]];
    
    UITapGestureRecognizer *DownArrow = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    DownArrow.allowedPressTypes = @[[NSNumber numberWithInteger:DownArrow]];
    
    UITapGestureRecognizer *RightArrow = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    RightArrow.allowedPressTypes = @[[NSNumber numberWithInteger:RightArrow]];
    
    UISwipeGestureRecognizer *SwipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:nil];
    SwipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *SwipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:nil];
    SwipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *SwipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:nil];
    SwipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer *SwipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: nil];
    SwipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
        
    [view addGestureRecognizer:PlayPause];
    [view addGestureRecognizer:Menu];
    [view addGestureRecognizer:Select];
    
    [view addGestureRecognizer:UpArrow];
    [view addGestureRecognizer:LeftArrow];
    [view addGestureRecognizer:DownArrow];
    [view addGestureRecognizer:RightArrow];
    
    [view addGestureRecognizer:SwipeUp];
    [view addGestureRecognizer:SwipeLeft];
    [view addGestureRecognizer:SwipeDown];
    [view addGestureRecognizer:SwipeRight];
    
}



@end
