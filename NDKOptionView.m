//
//  NDKOptionView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKOptionView.h"

@interface NDKOptionView ()

@end

@implementation NDKOptionView
@synthesize sliderVolume;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"Option";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_soundControl release];
    [sliderVolume release];
    [super dealloc];
}
- (IBAction)btnVolume:(id)sender {
    audioLoad =[[AudioLoadView sharedObject] init];
    [audioLoad volumneAudioConrol:(int)sliderVolume.value];
}

- (IBAction)btnSound:(id)sender {
    if(_soundControl.on==YES){
        audioLoad=[[AudioLoadView sharedObject]init];
        [audioLoad playAudio];
    }else{
        audioLoad=[[AudioLoadView sharedObject]init];
        [audioLoad stopAudio];
    }
}
- (void)setCustomNavigationBar
{
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithWhite:0.933 alpha:1.000]];
}

- (BOOL)             application: (UIApplication *)application
   didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
    [super ViewWillAppear];
    
    [self setCustomNavigationBar];
}
@end
