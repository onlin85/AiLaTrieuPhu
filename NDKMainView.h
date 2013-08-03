//
//  NDKMainView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/29/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioLoadView.h"

@interface NDKMainView : UIViewController
{
    AudioLoadView *audioLoad ;
}
- (IBAction)btnIntroduce:(id)sender;
- (IBAction)btnHighScore:(id)sender;
- (IBAction)btnExit:(id)sender;
- (IBAction)btnOptionView:(id)sender;
- (IBAction)btnStartView:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *btnStart;
@end
