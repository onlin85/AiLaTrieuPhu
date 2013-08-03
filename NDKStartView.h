//
//  NDKStartView.h
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NDKStartView : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *labelTime;
- (IBAction)btnHome:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *btnD;
@property (retain, nonatomic) IBOutlet UIButton *btnC;
@property (retain, nonatomic) IBOutlet UIButton *btnB;
@property (retain, nonatomic) IBOutlet UIButton *btnA;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;



- (IBAction)btnChangeQuestion:(id)sender;
- (IBAction)btnKhanGia:(id)sender;
- (IBAction)btnCall:(id)sender;
- (IBAction)btn50_50:(id)sensder;


-(IBAction)animation :(id)sender;
-(IBAction)answer:(id)sender;
@end
