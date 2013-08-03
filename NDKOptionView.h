//
//  NDKOptionView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioLoadView.h"
@interface NDKOptionView : UIViewController{
    AudioLoadView*audioLoad;
}
@property (retain, nonatomic) IBOutlet UISlider *sliderVolume;
- (IBAction)btnVolume:(id)sender;
- (IBAction)btnSound:(id)sender;
@property (retain, nonatomic) IBOutlet UISwitch *soundControl;

@end
