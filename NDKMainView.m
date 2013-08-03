//
//  NDKMainView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/29/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKMainView.h"
#import "AudioLoadView.h"
#import "NDKHighScoreView.h"
#import "NDKOptionView.h"
#import "NDKStartView.h"
@interface NDKMainView ()

@end

@implementation NDKMainView

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
    audioLoad = [[AudioLoadView sharedObject]init];
    [audioLoad loadAudio];
    [audioLoad playAudio];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidAppear:animated];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_btnStart release];
    [super dealloc];
}
- (IBAction)btnIntroduce:(id)sender {
}

- (IBAction)btnHighScore:(id)sender {
    NDKHighScoreView *highView = [[NDKHighScoreView alloc]initWithNibName:@"NDKHighScoreView" bundle:nil];
    [self.navigationController pushViewController:highView animated:YES];
}

- (IBAction)btnExit:(id)sender {
    UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Bạn thật sự muốn thoát ?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO" , nil]autorelease];
    [alert show];
   
}
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex == [alertView cancelButtonIndex]){
        exit(0);
    }
}
- (IBAction)btnOptionView:(id)sender {
    NDKOptionView *optionView = [[[NDKOptionView alloc]initWithNibName:@"NDKOptionView" bundle:nil]autorelease];
    [self.navigationController pushViewController:optionView animated:YES];
}

- (IBAction)btnStartView:(id)sender {
   /* UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn có 15 câu hỏi trắc nghiệm \n BẠN ĐÃ SẴN SÀNG CHƯA?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO" , nil]autorelease];
    [alert show];*/
    NDKStartView*startView = [[[NDKStartView alloc]initWithNibName:@"NDKStartView" bundle:nil]autorelease];
    [self.navigationController pushViewController:startView animated:YES];
}

@end
