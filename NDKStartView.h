//
//  NDKStartView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioLoadView.h"
@interface NDKStartView : UIViewController
{
    AudioLoadView*audioLoad;
}
- (IBAction)btn50_50:(id)sender;
- (IBAction)btnRefresh:(id)sender;
- (IBAction)btnHelpKG:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *labelTime;

@property (retain, nonatomic) IBOutlet UIButton *btnD;
@property (retain, nonatomic) IBOutlet UIButton *btnC;
@property (retain, nonatomic) IBOutlet UIButton *btnB;
@property (retain, nonatomic) IBOutlet UIButton *btnA;
@property   (retain,nonatomic)IBOutlet UILabel*questionLabel;
@property (retain,nonatomic)IBOutlet UIButton *soundSet;
@property (retain,nonatomic)IBOutlet UILabel *numQuest;
@property (retain,nonatomic)IBOutlet UIButton*changeQuestion;
@property (retain,nonatomic)IBOutlet UIButton*btn50_50;

- (IBAction)btnChangeQuestion:(id)sender;
- (IBAction)btnKhanGia:(id)sender;
- (IBAction)btnCall:(id)sender;
- (IBAction)btn50_50:(id)sensder;
- (IBAction)btnMuteVolumne:(id)sender;
- (IBAction)btnHomeBack:(id)sender;

-(IBAction)animation :(id)sender;
-(IBAction)answer:(id)sender;
@end
