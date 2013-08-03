//
//  AudioLoadView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/29/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "AudioLoadView.h"

@interface AudioLoadView ()

@end

@implementation AudioLoadView
static AudioLoadView *sharedObject = nil;
//@synthesize audioplayer =_audioplayer;
+(AudioLoadView *)sharedObject{
    if(sharedObject == nil){
        sharedObject = [[AudioLoadView allocWithZone:NULL]init];
    }
    return sharedObject;
}


// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
    }
    
    return self;
}
-(void)loadAudio{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"AiLaTrieuPhu"
                                         ofType:@"mp3"]];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {;
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
        audioPlayer.numberOfLoops=-1;
    }

}
-(void)playAudio{
    [audioPlayer play];
    audioPlayer.numberOfLoops=-1;
    audioPlayer.volume=1;
}

-(void)stopAudio{
    [audioPlayer stop];
}
-(void)volumneAudioConrol:(int)value{
    if(audioPlayer!=NULL){
        audioPlayer.volume=value;
    }
}
@end
