//
//  AudioLoadView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/29/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
@interface AudioLoadView : NSObject <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;
}

-(void)loadAudio;
-(void)playAudio;
-(void)stopAudio;
-(void)volumneAudioConrol:(int)value;
+ (id)sharedObject;
@end
